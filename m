Return-Path: <linux-arm-msm+bounces-92650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEjnLY6XjWkt5AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:04:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 509CF12BACD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 10:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3E3143021D3F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 09:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910BB274FDB;
	Thu, 12 Feb 2026 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJPSZBi2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6XpM0gf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DFB221577
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770887052; cv=none; b=U5rpa0InI1kvAWXYuuye6G5QHl2qkVRrmJSmBzLe3XeQ8dycrbMEbuQeyhuheqgmWQozSKN8KfGPF+nb7LKoLqel/UYSjHtkCLTbZ/a9VVrRK8J/GVPqJ0WsrpH5JGhRZk+HM4BSdZFmUUXVYXfIE3h4dZaZqK3vebJuCirz6SM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770887052; c=relaxed/simple;
	bh=wr+uvPGTgsFxiVpyo0p6xmUMYMJsgW+dOg1Iby7z5BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bV5I3teD5Ze8/+frMRZzwTEA+86XY8UJ/1MRnsWIO4l/qiMTri3PF1y4rRYsewv063oZjkE1fd85tP7nmpwdnzJUW4urFHBMWwqx9D9jm1umihPw44kPkVV4a3sNszRA24PzGtIbdKuD0qTJoa8BVTyNlos+qIn9PyPk5FmCoJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJPSZBi2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6XpM0gf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3SGQm357655
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0kcqtvA3ePB8KKYwiDSDXXTXzG7b7vVz14UKRtxCZg=; b=mJPSZBi2SRs62zNN
	izVIZFF5+TI6cdweIs2nA87GX+4vA0ao53Z2kZn9BMy0cpm2xyYhe3T2FtlXl09E
	hx+19aqhJVvLalcbaWYlE61/aR2+lnAQjQ/HJHevzt/JxngmprftgwqKzntifrLG
	IwzOyR2Zvta2M0uBvs3JBBPkW7yhfb8vLqmQsLTd1/44uLT4EqUXSp7G/GuFBzY/
	tsh1K8o0ASGZ3DWpVoCFK277j7J+pvwa8KMyPy6sShW31WPAw7Il3RZ2hrO5AV7d
	PHpvy39BOq4sbNmrTd4Jr/XGeB3u7w7Tr2iGWvfMEauVZHxDrJBl2l7g/pkn8xbS
	J6vsgQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8uy6b31q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 09:04:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354e7e705e3so4277421a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 01:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770887050; x=1771491850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0kcqtvA3ePB8KKYwiDSDXXTXzG7b7vVz14UKRtxCZg=;
        b=U6XpM0gfvMoHQ3sBjZVA9pkwktu4gjPd2xQDRyMwQ4MXgTM2fM1qBtmCy7TqxuTcR1
         xlKB/P2EKghKBH2qq0Q2qqoaDgU3jcUTW98qVK5t7Y1cglKROCBl8h3X5WAsIciuIOrk
         AD4Hi+OwyjGKNfuLszv8ViGVQhC6VK+huh3Dbs5TZPeEyjBuXjmtSM/zxmw4uDLcZHFQ
         mOqt+cdvIlHvGOUQ0AIUb+PBY/QWb7++h3CudFwoE83NmSF8s5Ajs+/lTI+diNsTAUQb
         clhLByU7zZQQFpu2Dx3yhZ6B88wjdWOfMGI7W8KyUUpfoBhgaDud823CXnaa0D38gsB5
         UIeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770887050; x=1771491850;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0kcqtvA3ePB8KKYwiDSDXXTXzG7b7vVz14UKRtxCZg=;
        b=IdI6k/ffPADG4Kgk1v045twN0xMct3GRTX1LU/Rhd5Bp6DmtNR8UrRbK7x+nCK7U4G
         MMZu+h+JDHNYJlpd0BGZlNUUB957NjMWDYUFZ7Q/QFu9LpF2CyE+NNRbgw1NxomHksfo
         Zxk447WP4MiizGglpkNfgM+EbfIF/nW3z6xYQS27h6bMMinzc8ereqYmzsNPlFAQyNtM
         mPgZlTSOQh4/c1sfBkOvlKbE+qsGaTo4TzqGwlj/T15UgYSxkWlkzCrIC7ek3fbJhOl7
         iU5JRhWzrL7NT7RCKGyZJteyWc8s13OGkNRfWr4hoYLCws6dzetdC39Z996YwUztdP+V
         oj/w==
X-Gm-Message-State: AOJu0Yx1QgYANZWM2JhjfsW8MmiYyWo0et7Rsiwdd4o5eMaGndEVY01S
	KkicrcyFuLhW5QSakNh4H22PWJxYfn4vUxUUfUNYTVXUk1Dvh8HAsdoPXN5k4qHLp2dwk1C9PoX
	7MLLphJZLEMLnddz2UXtz5yvcaBVrI0FOe5mX628/HeeAsHCHJCQzUGNU4OlVypU0B4/3
X-Gm-Gg: AZuq6aKIa091dN5jaCt1RSy764c2kywpxK/S6ZPbAA9IY7Kb1f3c+POusT34Q5BPyg+
	GW3UdFpC/fVsrsF+kt/TTZ1OeR+kDel7j/x9sEZEJ7wdBYYfxPI5UT5SZ9d7keUFfnBGXkjnw4a
	y/7PWYTIfVepl+4o1Yyj+/ri+9XLvHO5JqJYUuhz6SW6zyKpd9OezT+xsv29QJzqMOm4ZHClfFw
	SswSkeQUkxSc2doChRsqof5Qm0YdefSqDbxGB3IeD2S8PFim6WCX69jdZJM4EHhOG2MsrEx81YM
	bS/0zJFM1vrOM/KNqit06t0cU3S2t1zScTLDeskxRAk07jkjv2yRL2IDTpnN548N9c2cnw8sPN8
	GvHQdeP0/cW42uKM07CTAdZ4lWNVewJGcFn80CIEtmFp1+9VwdM5Iij9KXZHvtiP/Y5jhYTKFog
	kPdU8VLFjj87GHnnurQg==
X-Received: by 2002:a17:90b:49:b0:341:8bda:d0ae with SMTP id 98e67ed59e1d1-3568f3e103cmr2276267a91.20.1770887049926;
        Thu, 12 Feb 2026 01:04:09 -0800 (PST)
X-Received: by 2002:a17:90b:49:b0:341:8bda:d0ae with SMTP id 98e67ed59e1d1-3568f3e103cmr2276226a91.20.1770887049311;
        Thu, 12 Feb 2026 01:04:09 -0800 (PST)
Received: from [10.133.33.213] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e1967c884sm4457244a12.7.2026.02.12.01.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:04:08 -0800 (PST)
Message-ID: <8dbc18a0-6a64-491b-84b0-ba220c9050ac@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 17:04:03 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] phy: qcom: edp: Add per-version LDO configuration
 callback
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-2-231882bbf3f1@oss.qualcomm.com>
 <200b055b-7221-45b5-aea1-2462e07a3c1c@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <200b055b-7221-45b5-aea1-2462e07a3c1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2NiBTYWx0ZWRfXxGABYC6YCn+L
 F7fJOjU6yXiQWZCqSfTl74fuDHzASZeD0F9MyUKc87/GhzttUwwJYGoxq4zc5bLEInfhPe1nKLH
 pdR6y+WauKUHm0XR63yZjZm5yxRz5N2eDv/4g/a+vLFSIo0ddO6GXMkCb737zY3ZT9DLK3sT5Vc
 XIKjODeZzOvEar8kF84ls9J1szsyGRxW2ysX5ldKdOjMgY8HGKFicl0wl3r5qXz7yUg+86Zsr8J
 ZXgMdki5viP61qvTVRzJUv3DtEE6yRwyomtG5fwIy73N0iuxc4vSNYwNdaPO+2AaMUOz1rzWWa3
 eBPxhTjIPZyzUFmSKHozmOxYhJepIRCO+2VxQ4Be6ivHbjne5bVJ4QZomwYZN/IsPglfjixM+m/
 UqY6+ciRHx87liNS+gOFxfJS4Z1MvbhO3mmZDWVgvyz/WIgag/MZnDbIw+UhUF8LNkaN0u1rUT9
 Z2IvZ7fF4wSKHIkXjVQ==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=698d978a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=MeP4MrRKjM_wGNXPxAkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3ufT3pjooJVyGfEMH9UICHyBuGDL2Ak0
X-Proofpoint-ORIG-GUID: 3ufT3pjooJVyGfEMH9UICHyBuGDL2Ak0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92650-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yongxing.mou@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 509CF12BACD
X-Rspamd-Action: no action



On 2/6/2026 6:52 PM, Konrad Dybcio wrote:
> On 2/5/26 10:20 AM, Yongxing Mou wrote:
>> Introduce the com_ldo_config callback to support per‑PHY LDO
>> configuration.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +static int qcom_edp_ldo_config_v4(const struct qcom_edp *edp)
>> +{
>> +	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
>> +	u32 ldo_config;
>> +
>> +	if (!edp->is_edp)
>> +		ldo_config = 0x0;
>> +	else if (dp_opts->link_rate <= 2700)
>> +		ldo_config = 0xC1;
> 
> lowercase hex, please
> 
>> +	else
>> +		ldo_config = 0x81;
>> +
>> +	writel(ldo_config, edp->tx0 + TXn_LDO_CONFIG);
>> +	writel(ldo_config, edp->tx1 + TXn_LDO_CONFIG);
> 
> tx1 should be dp_ops->lanes ? 2 : ldo_config : 0x00, in all cases,
> I believe
> 
> Konrad
Hi, here i want to confirm again.. In the HPG main link brinup sequence, 
it not say write TX0/TX1 ldo_config based on the lane count. Only when 
we switch the lane mode,  the LDO config will be updated according to 
the lane count. so here do we really need this condition?

