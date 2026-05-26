Return-Path: <linux-arm-msm+bounces-109727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDucNL1AFWrJTwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:42:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3F35D13EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4287F300B1DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 06:42:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698BA37BE97;
	Tue, 26 May 2026 06:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+fmvfOV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dRwATpAu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F8C1AB6F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779777723; cv=none; b=t9K3pjIEtmidr+SUhwFIHceihkiwMSejiJKkgGeEO+JEFSjoybtM+szsr3SXfOpVf7P/4f8vyhe/Ygn95JpHZYveIWBbhkO9+YAObgEa48RzILpNgVqGGrcGGFfW6HWMYHNkZHyAPdUtsb6uY8ve9gMyjxSRGfmu17kRbSOIhBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779777723; c=relaxed/simple;
	bh=wYYvPGKKIfxvxOfDfzhnoD6V6y+gxUFtI1B+tZxdn3Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HkdGdVfc6YSWazYYkKY4YPOB1GGXBgCYIJD3kHn9/jJnu0IE1YwSNW+CnNNmPyTETwzjX+BRzI7mbYyOerqQ1RsWZN/StSNkaMIgeM9VtXkQitF7nCQSHRYSOBsALOPCCI+7NXCI4OU8P5+7gtKKc/efXOB4YzAa2dnR48Y40a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o+fmvfOV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dRwATpAu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q2mghP4117645
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nx7dST+rJAS+31ZmDGbjNSLJU/fJwkaTptXWG8RZ9k8=; b=o+fmvfOVsG24K0Ab
	hTzqZYO8ng4P6kSWsC5Ge2thjXLa0yQUpOc74ZnUER3rvoC4Jw30NRpy+qv6iBWt
	eQSJ+3EMZi7I7gabCCEqO1SnekFze9Z1gxaqMXv3mPRwBJtQOtm2Y+Knwn0YRo0F
	GKKzayvcnJRZ7cTrPUV8q0V7DdLmn1WXjcompefnjkk6Bn0Bq5nPLH1mx1Cizfpz
	wfR/Kx5v3AbB3vbyetJasRr1Z3hp6yEPPWR+aCeVgououlvkY7NzQv7yIF0VPXGs
	pHDsPGGtjSVIEbSGSnBtBngPCGrFbsU/ezuJGfOYgouumbw6pGL+QigtgIMl+MRy
	b0vivw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqudagc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:42:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367bb9caa54so9258710a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 23:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779777720; x=1780382520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nx7dST+rJAS+31ZmDGbjNSLJU/fJwkaTptXWG8RZ9k8=;
        b=dRwATpAuZMoXxNx8ehPumjmVWOOW9C/LC6P9UwL/L1ntKuzV0c1+ukTN6rHAMo6Grx
         KnlXiIUYTc/Lbzwk7GF3vwhmCDwDyjEEGRslqK+7QEwEI5GZh7qQGA00yUIIyjQrFgKj
         A7XPoSrdynWfB5nT4gDjONTFmA1wqg8E0U4ackL+1D/OIE63UkJnxGWBWC5/2bqFeJxJ
         Bcsgvq8p80suHGvdy9yk3CNGGacuXGz56TxbXodHNCJNRqFIzko8qYPkwJWcfFsUkMv5
         ZRy8hG2esPBfSwFefQITLBjx78692s+Q80MtseEmri7+BMuu6roFc9u3vft/7xVyORnV
         0wSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779777720; x=1780382520;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nx7dST+rJAS+31ZmDGbjNSLJU/fJwkaTptXWG8RZ9k8=;
        b=EY5yu/VMQO5juQqxgkyWQgCT4aKSgqKCzx2cIvmFpLbZsd+UdwXkz7G7a5kNMBlVbl
         5HSFL5ukC7UOKgpqiIr65M5v4Afz/Z0h1eujeFvfGjwiqJSUIHg4qWZJsNsLOxOD3y4v
         2SEfA/rcYXi7RJmBhLqnpZ7294cwSbvCMD1Q+S16bYwm+lpzk9gIMwqfbAeDZa6BPh9W
         6lH8/t0U3G+35kAhZFdQ9v5D3UFMH7ceZlfL9tPW5FJs9c8bisoWv25t4R0hJRFtYJrX
         zvkxDYNyim2nIzrNFvdcMH4YoR2VsDjm4MYIgCQlUM3GJWVA06YGHWsHgOz9L8bnGWCl
         njtA==
X-Forwarded-Encrypted: i=1; AFNElJ9Hb/cjbe5ydwe1Rwf8+LxYBn7ZZ1MZvtOrZ4VL6hsWhwK0kBV+cQOU+NJLGU6bF+97Ml6nWeoLuUx3a1zn@vger.kernel.org
X-Gm-Message-State: AOJu0YwBBrqMYkEREuw+p1tJPQs+I/Q6ubFLtrjVhIrlnq+sK/fLwl5N
	/iuLXWN18Cultig8nTBDVBxgWf7CjHZdxBfV2ytwfAodT/Ai8nfTf+9BVa+RiHQrOutAwqNFlxd
	+kYxnqQezAGvND0YP2n/tbXzb+g9zqLCyf5pYIopfn2uWcCtNG+RZ5X7zjObx5U0cmKLp
X-Gm-Gg: Acq92OE6oGS+FB0FlRlWqZzKkBYv2nnijNEJGPiLWspmRzfNJCH88COXJpr2eTzdRxG
	fE6dbwEJvmVttWrgPqt2i65lH/SN8+2uLAdsslDbIvJTBYip7qB7lhTrIz3ixANRl5Zo1sKYH46
	eBJ7HudZfOR2Zgspx9VC+AMauIwaAU5pXOzkP7noOXUJgxksyC8D+berMkOBxOMD/jAtbT663Se
	jnZXZkxvvZM2RUs/Ywma7bv4UWQmBeeS9t+dBMQIbsfOEylzemmDkHTzPK6PZ0zVHbHb1cg2bkJ
	2I69O/u03E1O46LlSZXQ2vQySVguuTauzuUVdN/NbU4XG4wQYBfr49rL9jdJmOk5tV9C7XuLNbM
	LQ3SeYkethCxKimeOwK/IROUd3ut1QHvtn1CRcW9jKkZoB9tCXw==
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr8607075a91.9.1779777719855;
        Mon, 25 May 2026 23:41:59 -0700 (PDT)
X-Received: by 2002:a17:90b:56ce:b0:36a:cace:a4b6 with SMTP id 98e67ed59e1d1-36acacea4d5mr8607044a91.9.1779777719373;
        Mon, 25 May 2026 23:41:59 -0700 (PDT)
Received: from [10.92.181.2] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36b0d6a612dsm810455a91.17.2026.05.25.23.41.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 23:41:58 -0700 (PDT)
Message-ID: <190e16f9-f467-4446-a5ee-eaf01ad55861@oss.qualcomm.com>
Date: Tue, 26 May 2026 12:11:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 3/3] phy: qcom-qmp-ufs: Add UFS PHY support on Hawi
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        alim.akhtar@samsung.com, bvanassche@acm.org, andersson@kernel.org,
        abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260522172716.820490-1-palash.kambar@oss.qualcomm.com>
 <20260522172716.820490-4-palash.kambar@oss.qualcomm.com>
 <szzkygcwnrx2p54hbulzd3edhwzueaulhpyl35b762yo4enepu@zgzv6oxdocha>
Content-Language: en-US
From: Palash Kambar <palash.kambar@oss.qualcomm.com>
In-Reply-To: <szzkygcwnrx2p54hbulzd3edhwzueaulhpyl35b762yo4enepu@zgzv6oxdocha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JX1f475QvPYeOtTBu24glQexPfslM8Wx
X-Proofpoint-GUID: JX1f475QvPYeOtTBu24glQexPfslM8Wx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA1NiBTYWx0ZWRfXxiSMTI5IkuIZ
 2BMGyMRAaUQIJcfSefwMlP7J7/qZh2nCPBnYegF7S+3es51WwRx6zCBIou+3hEamGuL1UpjZGFt
 JG4qdKrMK4f13HrGyLph4c6xr3Xmka91THRixKKfQs9cT6raGx0coR+qs3Ia9ywu9mBfnmPlqGP
 6Ctb4O0YTBYC/UPEdIu9ulGzZlDm/En6ZdFAj+E59Q1DOGZz2/pYQmdkXnq3YNxH9ep0EVGRjse
 7th9uv56iicowFcMiUUsy8/3RYgWPmbWesGm6IL2ogxBE4l7+aZO+QGoT9ok5EnVX9DI1F57gUK
 8SCH2G75my/vAHg3gbfr41XzzPQtd5iRmdhx6hJWmVHDDvx0YBcQtMBPZajk6ZcGgk78by99gI4
 olMjjz8q86NBkpAGKfzhXRgiSxYjeLfw90nQVimS2h5aqIE3D3yUphyBA/gjJOqYaQt8hk2pwP2
 b7HjKfOwCCVZPBR1LJA==
X-Authority-Analysis: v=2.4 cv=C9jZDwP+ c=1 sm=1 tr=0 ts=6a1540b8 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZrBsj_3XA7F7z1mTZmAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260056
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109727-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[palash.kambar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B3F35D13EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/25/2026 2:15 PM, Dmitry Baryshkov wrote:
> On Fri, May 22, 2026 at 10:57:16PM +0530, palash.kambar@oss.qualcomm.com wrote:
>> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
>>
>> Add the init sequence tables and config for the UFS QMP phy found in
>> the Hawi SoC.
>>
>> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
>> ---
>>  .../phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h    |  24 +++
>>  .../phy-qcom-qmp-qserdes-txrx-ufs-v8.h        |  37 +++++
>>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c       | 140 ++++++++++++++++++
>>  3 files changed, 201 insertions(+)
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-pcs-ufs-v7.h
>>  create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-qserdes-txrx-ufs-v8.h
>>
>> @@ -1306,6 +1315,12 @@ static const struct regulator_bulk_data sm8750_ufsphy_vreg_l[] = {
>>  	{ .supply = "vdda-pll", .init_load_uA = 18300 },
>>  };
>>  
>> +static const struct regulator_bulk_data hawi_ufsphy_vreg_l[] = {
>> +	{ .supply = "vdda-phy", .init_load_uA = 324000 },
>> +	{ .supply = "vdda-pll", .init_load_uA = 27000 },
>> +
> 
> Stray empty line

Will fix and Update. Thanks.> 
>> +};
>> +
>>  static const struct qmp_ufs_offsets qmp_ufs_offsets = {
>>  	.serdes		= 0,
>>  	.pcs		= 0xc00,
> 


