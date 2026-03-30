Return-Path: <linux-arm-msm+bounces-100821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IilFXSNymn09gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:49:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F7C35D286
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 16:49:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 367BD3020CFD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 698D12EA731;
	Mon, 30 Mar 2026 14:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E/fjlZaX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzsPU/Cn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC8B2FB632
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881602; cv=none; b=s4B9i+deNS5MHErDz8zs95Tgku871wVrWPj/PZmWe3Qx8VO6TUrVGXQNySdLbUJ6LwtR9MkUuNQbq1g+J7c2m3ik0ozqKbMBuClVHQmDDMUkMzRX7krgKAePgCDQN5YxCzQasyeEWtFFmbyvDlFwQOkqEFEqolGUx6DY+ijorBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881602; c=relaxed/simple;
	bh=74ntAUr7NapuW8nQdYTPtYuOABRG0syCWtfXjwYJ4So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E318T2bJrf0iZTxYujUd9bHYQas6EcF22sCNHmwNBpXI3CSajUknydf7V8KFUTK07laOh0CJqJkYxM9+T6LiAwT4M1FK3oURoUJJxDQF6H6k+bwSdI2ing1aKVnsjGQOjno7Mx715goW5kx5kWLfCNygynpbLXZlOfKHdutZxdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E/fjlZaX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzsPU/Cn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCZuRY703490
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jNd6ZWcETXw9Y9u5C/2GloaCm+w+bAJXQCKktGWQ8s=; b=E/fjlZaXcxfiOVq/
	eeeB4AJzBXC3iF90UDASj8DxRWkSLnz87BrWA4Yj7eDWgc9T6GH0FpwZQPfLNhWf
	3RJCoUUVZZDFW9bpfT8x6ffAqjfEqE57FUzFx+SE7Q3LKuWLDZcjYlC+1YdZsquJ
	D3tIGBiJRxKNu3zV4HlrvsVEYzztt+C1p+gyxD0NFLAZyJz591b6/juTkml9qVFM
	buJCfm2sagR5Dq+UcokZTh2toTjv+VpFHoOXT6TnY4G2VvTWsuDzcYyIMDpTexg1
	KrS4KWrz8qM2RnXSGkYNaiSNPHXiLg61HJq8/rPai/2cdcriDD8riYE9RykH8YnC
	eF+2rw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sanrg7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 14:39:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b0c92ff4ebso45781515ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774881599; x=1775486399; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6jNd6ZWcETXw9Y9u5C/2GloaCm+w+bAJXQCKktGWQ8s=;
        b=bzsPU/CnzIihJN5fa7rlwMvMZL5XobDiUJ56+h+UpPDjCX7yiF2DN1QiDQpR6KU0xp
         V/k51lZ+YaDlW9td9dVkC5hsVlqgozIfIjAAbok12sOHMZ3c29SvJb/xcWgBNnSqaoBh
         fiHrOb8+zZTyXqL2Y45jQpdc81LLdWv/ene9x7FNTVZSayozdvlOLvXvkhGjGl1k6i0A
         8oPusggtrmErXpFcMBc9ValkSZUP3hmc3WwUTXQ0Sw7bYobTbtNEhQTTR9MgrFqn3f6w
         wYNFLejK4OCBBlqUO95jkD0n59pmnol6zRQsa5w3mT8xqKB7Iu5G1BWj7md+cjxr9B9P
         g/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881599; x=1775486399;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6jNd6ZWcETXw9Y9u5C/2GloaCm+w+bAJXQCKktGWQ8s=;
        b=QNRoLThN7aV/fIlomvXlnDPWGYUHFEF6ABiNDLtn2tMgSeOtmnyut3bjqRtkfdE+Ub
         BALjf+cKNIOCMNvJ0ItfitDjqqL0e37ANOIjzIuZOq/KNROAYw3mxqrHBBId7gdsY5PQ
         OD5zUStfR9NkIcu4Yl9A2Oxl2d1zJXD0H/RTiuNZbsnwfampNGdP0/CUOW+QfJWQgJKt
         Xhi6kaPqbLqJ++G57I7d0lyBrF9nyR+QpO2wC1dIg1fUwrp8QCFQ0VfTPlYykpWhWJMe
         seqLf6mQaDyROOOLNC1tzxmyk961z5rXtYBHx1cSONYQbsFrgPPtzY4dtINr1WELmsVu
         UKCw==
X-Gm-Message-State: AOJu0YzhbMo3JtarC81ewI+YE+LgAe250YrWL9JZ+AqHGmie0FebhY+q
	WlipxXCcCDbnQb8ZuMOyAETeAmnxoYAbZt3nDLDoIe8pJ0KMTiJ2+64s6YwzMk2rc69+mMYAWto
	wkD61pxmNujiUZ/8B9JT59kEoC0i5T4gawdUELv63999bjGtYKUricOZHYQvXRn2gaBcP
X-Gm-Gg: ATEYQzxLDAMXtAuhStOlGq/aboo56+MLnQPRlkaOgZqOfKmr9KAxSqZarfp1xByhy/Q
	bQlp3O6LVDJLstnMgnNnZePlLN+i2zHy2uJLQ+udFOmqjYo6BeXwYo3wifpoP/yceolhji4m17X
	yGU2mLItTqU0cwjN8OOjqMy45yh/50JSWfF6oegqK/T40yocCVtY6R4ZkbAMFPet8oz02iO+PyG
	ghqKUybScxbiZGLzI5upSblUL1s24CqJr8R3FJIm6B6OWMSABvZBM4uROhdRLEbU5tVwAOL89ad
	pTwW8AXDbtyL0CKwxKALhVf1drfqR/KHL7vwRc6EXipUZedkWNtwvSUlN+y6q/JXr6RiWhPepn7
	Zj4uuW8mW/Ejf0d0H5QIveRT0FjCIiK9lOVDagh5+DAJns92DYS4=
X-Received: by 2002:a17:902:f542:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2b0cdd7bb09mr134148805ad.38.1774881598570;
        Mon, 30 Mar 2026 07:39:58 -0700 (PDT)
X-Received: by 2002:a17:902:f542:b0:2aa:d5e5:b136 with SMTP id d9443c01a7336-2b0cdd7bb09mr134148525ad.38.1774881598074;
        Mon, 30 Mar 2026 07:39:58 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24264292asm86567855ad.4.2026.03.30.07.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:39:57 -0700 (PDT)
Message-ID: <7fbd9d3f-a313-40dd-9335-799aea5a077a@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 20:09:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] ufs: host: Add ICE clock scaling during UFS clock
 changes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260302-enable-ufs-ice-clock-scaling-v7-0-669b96ecadd8@oss.qualcomm.com>
 <20260302-enable-ufs-ice-clock-scaling-v7-2-669b96ecadd8@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260302-enable-ufs-ice-clock-scaling-v7-2-669b96ecadd8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QHxiqgEIHKT-zGhQGVw5VIUpBJcF7qm-
X-Proofpoint-ORIG-GUID: QHxiqgEIHKT-zGhQGVw5VIUpBJcF7qm-
X-Authority-Analysis: v=2.4 cv=NofcssdJ c=1 sm=1 tr=0 ts=69ca8b3f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vKCOo-aWrrhi_IfDXuIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDExNCBTYWx0ZWRfX18jDNU+Azce5
 nzxgjprW3dcdjEvX6Y9Ne6HeLZfya6oCdP2ObsfCE7fofFrEcg5fAaEzxDolZyK+bZpmbITFYh3
 SK4XU6vSdzZBVAIyHpy3MsJk7EARAhieiyonHDv7VM4ePSsHWnO4peAABQqD2crAMCUEgM3y1iy
 ht4q7N0kRWLlzFz1GFRVRXAnvFZ5SCsqtyUaH8MGvlNLfcgMTkXZLiTJvEeoZwtV8KTOsQtFnwy
 WlYBJajkmU3a8QRJZsc90agK4MxiShG2Raqrxy+8/v1ivQTLYQ+BcfapYuw5RfB3vBhv8hINoiD
 k6chu3/9WCF/Qsx4CZhsXKR2RsT2RD31KKYIC1yjNSRptQlrn3AQY1jhfpVOTBmDYkBYrCenfsv
 dcJ00vHVo6/58qGkDjnAQZBQQfyV5Dzu0aHZbLyVqxcFOBKiMfqRGUzG/iHaYvnx0phE0bGdweA
 lr5PRLGt2pKJIehG9xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300114
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100821-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D0F7C35D286
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Abhinaba,

On 3/2/2026 4:19 PM, Abhinaba Rakshit wrote:
> Implement ICE (Inline Crypto Engine) clock scaling in sync with
> UFS controller clock scaling. This ensures that the ICE operates at
> an appropriate frequency when the UFS clocks are scaled up or down,
> improving performance and maintaining stability for crypto operations.
> 
> For scale_up operation ensure to pass ~round_ceil (round_floor)
> and vice-versa for scale_down operations.
> 
> Incase of OPP scaling is not supported by ICE, ensure to not prevent
> devfreq for UFS, as ICE OPP-table is optional.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
> index 8d119b3223cbdaa3297d2beabced0962a1a847d5..776444f46fe5f00f947e4b0b4dfe6d64e2ad2150 100644
> --- a/drivers/ufs/host/ufs-qcom.c
> +++ b/drivers/ufs/host/ufs-qcom.c
> @@ -305,6 +305,15 @@ static int ufs_qcom_ice_prepare_key(struct blk_crypto_profile *profile,
>  	return qcom_ice_prepare_key(host->ice, lt_key, lt_key_size, eph_key);
>  }
>  
> +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
> +				  bool round_ceil)
> +{
> +	if (host->hba->caps & UFSHCD_CAP_CRYPTO)
> +		return qcom_ice_scale_clk(host->ice, target_freq, round_ceil);
> +
> +	return 0;
> +}
> +
>  static const struct blk_crypto_ll_ops ufs_qcom_crypto_ops = {
>  	.keyslot_program	= ufs_qcom_ice_keyslot_program,
>  	.keyslot_evict		= ufs_qcom_ice_keyslot_evict,
> @@ -339,6 +348,12 @@ static void ufs_qcom_config_ice_allocator(struct ufs_qcom_host *host)
>  {
>  }
>  
> +static int ufs_qcom_ice_scale_clk(struct ufs_qcom_host *host, unsigned long target_freq,
> +				  bool round_ceil)
> +{
> +	return 0;
> +}
> +
>  #endif
>  
>  static void ufs_qcom_disable_lane_clks(struct ufs_qcom_host *host)
> @@ -1646,8 +1661,10 @@ static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
>  		else
>  			err = ufs_qcom_clk_scale_down_post_change(hba, target_freq);
>  
> +		if (!err)
> +			err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
>  
> -		if (err) {
> +		if (err && err != -EOPNOTSUPP) {

Using -EOPNOTSUPP here works fine for now. But anyone touching any of the lower APIs called by
ufs_qcom_clk_scale_up/down_post_change() needs to ensure they don't return -EOPNOTSUPP, otherwise
hibernate exit will be skipped. So this carries a minor risk of breaking.

Since regardless of whether ufs_qcom_clk_scale_up/down_post_change() fails or ufs_qcom_ice_scale_clk()
fails, we exit from hibernate and return from this function, I suggest you handle the error for ice_scale
separately.

>  			ufshcd_uic_hibern8_exit(hba);
>  			return err;
>  		}
> 

Add the call to ufs_qcom_ice_scale_clk() along with error handle here, and let the above error handle
remain untouched.

		err = ufs_qcom_ice_scale_clk(host, target_freq, !scale_up);
		if (err && err != -EOPNOTSUPP) {
			ufshcd_uic_hibern8_exit(hba);
  			return err;
  		}

Regards,
Harshal

