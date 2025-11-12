Return-Path: <linux-arm-msm+bounces-81336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D46C50B19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 07:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 84EFB4E5FE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 06:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498312D97A4;
	Wed, 12 Nov 2025 06:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8Qus7B1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAhR7Q3t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1652D5A14
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762928746; cv=none; b=qFCsXhBUvRWr6RL9nH0VEc1R+JkaPbZ83Wt70u+iZzFujS0tMgnsovh0KVL7PJZtwgD1f0DjoGnFLWYIBdhFWdsdkk+f+Fb5UzGqGLmw5SR7jjg8TLGOXvaGoJSXKf+jSX2w9OmNtxof0Ti1f9hwbbN9mZHPOHm8Ti3o2DZyYMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762928746; c=relaxed/simple;
	bh=RDA4LzPk3maSgQAGPSWxx/Jhm7JGlhcxeaMTKnnn3x8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMHKsIbsk8MfwL2/N8/StGpFi1QXs2sZMpQbTQwID4VAuU2/Ns8aAnaJZyAmjHZ0lG78ueUsaVKrix/2F399Pfqtp+6gF7Gky/9uNCsORoKf1hGNyDHwDY/BXe8mLiyMwTacc9HPNBNt3HFiVU8QitueQM6KH6/U3Ec2l/Kdux8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8Qus7B1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAhR7Q3t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC0w4YH4008081
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZwTrPuuqQ5kUNPyeNuPlDMBg
	Z7FIia6QmEgvCuHsG9w=; b=D8Qus7B1RGEYvtVDlN2VKOXHMyXBYbUmEvK/aNEp
	XaVXd/NooKZiSJavgJZqlLReiotKGBekBbbvtwnNyX7JORN2XAMOm4Un2LRJzbtH
	8tj4kLy8He4AMBMvseb4C2dBvVEgABuvenGs6q9Kfb2udv15rfCetOWArWQ0JEmn
	dF2RZhcESxkQxQ8vJE9oAvE571wAHmJjlKBG4g+lFGvhlZm8SIAv7ewbOGO9PQBn
	1fC6Kof9VrbOBOhW9KZQYzfh6sgWuJi8hsf3l/VUWSCFdqJcCsah/2ZHzlBpq1Yk
	UgfEcpqujR7IMDzkpYzNlRvfdZHyTM2941tIYr+D1pPNnA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acg5bgseq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 06:25:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7900f597d08so535726b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Nov 2025 22:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762928742; x=1763533542; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwTrPuuqQ5kUNPyeNuPlDMBgZ7FIia6QmEgvCuHsG9w=;
        b=SAhR7Q3tIY7xydQXJYTLHyFIcDLeqWxUBWcw9MpCNCBgjYSzDn/CIJHeyiMLoXZyjz
         1odmV5bsqloakuJreNJUjuMBbPQOgABY7yEr/t+69XGyLYiHnFTXfh0FAymskRg5EI9/
         AgemSoZZVQwQJzClNay0ZRybEg+wBBPTgf+hPkBzYabD+7KUZnzBzxgo56rQ6RftQ1/r
         HG+iJfyosLt3IBTSRY2W7SaHdynhssWkwhcTjxJYcm2sEL2/y8wnIIJ0kznaoB2bgqr9
         yFmgahdabwD218/Tbhpg5qfRVU9cyI0KElFPsCeL5tM+/9OkfOUn5zRTjVukowZGo2Sy
         b4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762928742; x=1763533542;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwTrPuuqQ5kUNPyeNuPlDMBgZ7FIia6QmEgvCuHsG9w=;
        b=WpQMq9QY9bLJE8iczuWevhmC1iewc2sQ2zJQe/p6w5l7u/Xtzus2TSxlXivbVEX40L
         r/Gg8NbQtWZBuDBG+zsJIesQnQwDM4ojQUY/5/ztBK1qcOz4oWFKsl/EMJwYN6VBGHJy
         2eJI69VyW41qBcVCZD2rtG82T+gB16cjwTGYL2NQtBpaFkXLO7r4UKNGk0aZl3ehPiwB
         7IwKRhyGUx1mY7BTZsQCGSUW66NnCX6ZQX/+Ht3G+UFZQYWe/hVDZDhBliEDgWPhp4y5
         f5TAWnJA36zl4dAMfn+1cqePkBJ4h02p4xVhue/dQ/wRqCcFB9fkO8mMotbES893chXW
         zGgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWoXBByM7ux29dJQUL81qjSaR+JCa1i8amuf1mYsJILD69h7qiC1y84av0aZZXowoAzSSeuYTOQ0OqidT4h@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx/MYq+ExWh7mzjMYRU0muCx6vnuIQAJtful7MAFrduVO4gx2Y
	UrVIiG17XI4DygzFoS5tW/Gyg8ExL2lSqlQXib6MCEdDPCPcxSzpNAVZStFPyP3pALQofO2NsY5
	ADT1/3cr2WxVhAUe6iMzPOGV3FlyYOsC7vhcu6Sg6OmTFddF+RFBLn/c/9UyFXBFH6Wp5
X-Gm-Gg: ASbGncsQ8f2PgLYfUqvbVLbO24iXJfg3y94YZS6eoCIOZIoSiMiRNhPHNbD7figQErv
	HZLAHdlA3NfrB4TJCwpBeZ0SUqwBpHzIzpQe6M9/+88jMwciYHcK6VhaywPtkkn2pwkQpgBtnLR
	QXhSMdO/E9BBSzL0kXvsXSyHGUUDjlAir0H+7Nn6yo37YX80gFO4KN8vcVjbjYiL8fNTBLsu9cu
	RflrlrTuo1h2VYWmsiZSuynSUPihl+cO4EmaoRQB6P070wM6iOW0AskdoXU93j/AcLK+yyXrSNQ
	7LdDuGoQwZbv9FohWf5gaQbqYCPZiL3lI6q4eOArTdWMHXZKK1FPO2eUAVpZFi8N98ALIrGOKe7
	gQrsVyVpnsAW2jh7DYazu9jRdmJDFjKalMShi
X-Received: by 2002:a05:6a21:3384:b0:355:1add:c291 with SMTP id adf61e73a8af0-35909095f95mr2684091637.10.1762928742231;
        Tue, 11 Nov 2025 22:25:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7S/HbpcFUy6Id6iVkQsaUPl6jWNJy4+2pSyvWNLTMUPGF56hhKNHEj1W+hDgz/gITQ8wsjA==
X-Received: by 2002:a05:6a21:3384:b0:355:1add:c291 with SMTP id adf61e73a8af0-35909095f95mr2684069637.10.1762928741682;
        Tue, 11 Nov 2025 22:25:41 -0800 (PST)
Received: from hu-arakshit-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0cc769e59sm17159899b3a.50.2025.11.11.22.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 22:25:41 -0800 (PST)
Date: Wed, 12 Nov 2025 11:55:36 +0530
From: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
To: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
Subject: Re: [PATCH 2/2] ufs: host: scale ICE clock
Message-ID: <aRQoYHsOuCNhBmzD@hu-arakshit-hyd.qualcomm.com>
References: <20251001-enable-ufs-ice-clock-scaling-v1-0-ec956160b696@oss.qualcomm.com>
 <20251001-enable-ufs-ice-clock-scaling-v1-2-ec956160b696@oss.qualcomm.com>
 <d31e4bba-5438-480b-8d3f-229ac5b4ddf4@nxsw.ie>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d31e4bba-5438-480b-8d3f-229ac5b4ddf4@nxsw.ie>
X-Proofpoint-ORIG-GUID: iVSJL1GZm3k7tEfGrHalQULp8J1JmzAZ
X-Proofpoint-GUID: iVSJL1GZm3k7tEfGrHalQULp8J1JmzAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA0OSBTYWx0ZWRfX58ZS90w+z9SC
 8WKJe/TH/Wux/j3kisZ1gbpfDVvDRc4lduEpUfDKonhA2kF6FIlvqLN789PbIZlAKLzqlIhW8Mo
 GHEoFPv7vOJDxYhd5Ld5Y7fM1tDBy6bNhQ5vKarsf9qXipRJhIcwlo/WoY76VeSI8JdmbBz4gAl
 9vdigPaM7pjf7+mHL1c75YRN9ByR9m7882YeS8RHk8jdb1sXZfGsxysZZ0XGsPiYoLGrVNxqbNe
 LegLbwV4oLyEoc088PnqQcXGRSd3h7SBWO2+ZA+KZ+f1NTfYZaokAJyT0DYhzNed0ivS6DQd4pQ
 5KktJnlsYQHm+YrdwHi9zi0QJiN7a3qlvuHNKwPw13WPZ42h/X3GcCvOYqMxdQNB50iNVP4zhoC
 7OAfwiNOeUck+N+7EWXu92uxr5KdsQ==
X-Authority-Analysis: v=2.4 cv=YYawJgRf c=1 sm=1 tr=0 ts=69142867 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=0fylSbPx36-Mud_k70YA:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_02,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120049

On Thu, Oct 02, 2025 at 12:23:37AM +0000, Bryan O'Donoghue wrote:
> On 01/10/2025 12:38, Abhinaba Rakshit wrote:
> > Scale ICE clock from ufs controller.
> 
> UFS

Sure, will take car of it in patchset v2.

> 
> > 
> > Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> > ---
> >   drivers/ufs/host/ufs-qcom.c | 14 ++++++++++++++
> >   1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> > index 3e83dc51d53857d5a855df4e4dfa837747559dad..2964b95a4423e887c0414ed9399cc02d37b5229a 100644
> > --- a/drivers/ufs/host/ufs-qcom.c
> > +++ b/drivers/ufs/host/ufs-qcom.c
> > @@ -305,6 +305,13 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
> >   	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
> >   }
> > 
> > +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
> > +{
> > +	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
> > +		return qcom_ice_scale_clk(host->ice, scale_up);
> > +	return 0;
> > +}
> > +
> >   static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
> >   	.keyslot_program	= ufs_qcom_ice_keyslot_program,
> >   	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
> > @@ -339,6 +346,11 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
> >   {
> >   }
> > 
> > +static inline int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, bool scale_up)
> > +{
> > +	return 0;
> > +}
> > +
> >   #endif
> > 
> >   static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> > @@ -1636,6 +1648,8 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
> >   		else
> >   			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
> > 
> > +		if (!err)
> > +			err = ufs_qcom_ice_scale_clk(host, scale_up);
> > 
> >   		if (err) {
> >   			ufshcd_uic_hibern8_exit(hba);
> > 
> > --
> > 2.34.1
> > 
> > 
> 
> Once fixed.

Sure, we can bubble up the error log here. Will update in patchset v2.

> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 

