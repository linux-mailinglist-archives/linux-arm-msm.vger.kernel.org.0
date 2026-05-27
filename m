Return-Path: <linux-arm-msm+bounces-109933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGldD9CQFmrqnQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 08:36:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C9A5DFE88
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 08:35:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A1EF3119F0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 06:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38543376BC1;
	Wed, 27 May 2026 06:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pT7WAYQ0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UiTwMNMS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C522377015
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 06:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779863242; cv=none; b=Kewbwvy8zkhc/qNTTbSxVuL6uqV/q7KuvHEOrGoG63hqDH8hq0aM12HHtibOBccEAKoS8upSdPDMTuG5KER3kMgTypf1P5f3gdfv76mLzvYQHRBQZuBj8CxoLGIZ6DhLrHmaEXiNKN5/2MLp9pnnw9KNt148RjYoYHcDWv8zPSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779863242; c=relaxed/simple;
	bh=QoEPMVUFCrdTu3dFrKxpXDhK5QkrCJveBp9Jo0KUu1Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yy/0XNKiAXKwqT73UL4YsmSHzl40FU+PdhPDcBaC7y9Ne5/1KvtEsog+G7Klgaehy7kdTGdvQaf1bQZFeXAlSh+x32NPbGhh8JAa4/8e5MHluEBl82QcTWp5yJVeBlx3oReV17dpkHU9lUTovmViqox/FvphwkThGWwzjn+8dPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pT7WAYQ0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UiTwMNMS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2WhQY189753
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 06:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6dU205cHGcCVdQJGGLYo2nsq0Ll/crMV3YgonLyTuLc=; b=pT7WAYQ0k+Ya74gS
	wFgwiF7hDNQUI4g2K0FWNMQkPKDfwZJsQdibBtZNS7NO81jYBBbwaj8pp3c/9YuX
	P/jBZaUjzUOIh6DM48jygjINQJtHWRPz6WRHs1DAGEh4F0gwqZWeFyW8loBZZDi/
	w4egqnTG41fDndrD1wMwQuX7GYcJUNwf8Aoiv8e+TN15HZN4OHTRTrNquhfg1s5K
	zOcGXdmN8CFqdMA5BDKrd4+svzCm1VW4DnNHME9/5oDOkfRx0YmaF53myoLoZgAC
	4cxYAsB7PZyC3f+6YGIoLEXsJHk1ADDJveyR32sLEGt7eBIkGkbQ4NoK3fLF+lim
	H4GPPw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh179xxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 06:27:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9fc5bdfaeso29203275ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 23:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779863231; x=1780468031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dU205cHGcCVdQJGGLYo2nsq0Ll/crMV3YgonLyTuLc=;
        b=UiTwMNMSrpbORvFmWVfBqKillpHRENE4jzby2HoCCs3LIfRWftumahBP1nJ0NG5Uuh
         P9dxsyLxLdMOInYYnv5fJIcmbAZZDJEqx8a47QyyX5G18kPOPzxEDsyb1J/bex6ZpQgk
         SjJkQ+OwVl+QRFEcF4HvGaXICvxWD6s+k4PcUjSHeROwj3rjK2zLTDfa1DL355QJaQ71
         GJemLNnk4NZf1Kmb/nw/yMirg2HVrmRSREgR8MUVzoLA8cdjkzpbzHBC99WQNRYUTyGj
         p01a0tMJtS1XpGMKcXAoZNg0OTNu+UCqd1R3qMgDmqrkps40/4lbXeG7FJRaaRusHLzo
         /31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779863231; x=1780468031;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6dU205cHGcCVdQJGGLYo2nsq0Ll/crMV3YgonLyTuLc=;
        b=sPOqXCg831PJftaMRhgW9HqgIdREz6r6Iy29GUN4qiMr12UB/T2vONaxeNvsUMs/gb
         +d5l48It2l12o97WK8x3n5p6Km5Gm1ShcSUQ7ilg2rdLAC2aDpiM7yshSAc6jv6kKcVL
         VAnnjc6lDLDug5HIlVVG7MYIF+Puu/IvM4xncOZIrbb4s+8VPTe8HLVgsOCewuFJOfZo
         8SgxjSI84M44UoLgxsfyB9eP/JoeZTTB2RpOKTgk5SsVTlmzqnC0FugKhAKYsQo4TO7+
         IZBZELHtJkegc9GwqJkwTJ5s6NazD14mVinioUv6VWFQpyA4V1SUn4z2J/dcDs7SHiL1
         OmLw==
X-Gm-Message-State: AOJu0Yy0UDeOSGHcQ8ZVJqeUyz4P/nijlD0/AGUJSXkxH27JPaUxacpm
	2TfGxGoVK4IczzDzW2cNp0KE+n5SHzy23clX6r2eJh4i3hTT9JwmafW3736EyeYolfQB+4l91Fp
	uYyffVHFgpQOWFtabpNyLwoi7NDWaYyU6semgWlB4Mm7LsjeRuxpt1dTWWEfZpuEI2Rmm
X-Gm-Gg: Acq92OEH9DjA5pb+/o2/3oUxDIo6TygInVQWxrZabUpnxSe22e6OzEKvOsEy7xKx9t9
	JCqsOLX1TwnUxFa8wWO5G/617bkFIrvq1MLwnRJi8w3ND6ZVHAs//8iBiCDsFXsXB0QNF3pgrXw
	PnSJxqMyAs5S5Xf2kQYvZqmsXUuRNXSNatJjbBuarjtIpnv6vzPS/jetxegOHApIxxKPI06+e1b
	+9ooqbldTitEt68Sd5RMR7qcpTarK9kjFxdh0OTHdiMLDBE/CWTdFXSeOQMQkuDnMLhXRXs3bw0
	gO0hdyyOrBbdIvUFlLjGgKRnaALuwB5Co1Mut39sRXygvxb1y0e/thlCpMeyaX2EfmBzMVVD6uC
	Sf2oXk1/H4eIj8lyxMybG+PAzBALjGD84/QpX1DvNaq2x7LZdZz5XUp23Mo920CKSzJKsv/+FZj
	1MT3oixIE+s5U2yrmV
X-Received: by 2002:a17:903:3850:b0:2ba:7374:76e7 with SMTP id d9443c01a7336-2beb03312ffmr122769845ad.0.1779863230635;
        Tue, 26 May 2026 23:27:10 -0700 (PDT)
X-Received: by 2002:a17:903:3850:b0:2ba:7374:76e7 with SMTP id d9443c01a7336-2beb03312ffmr122769675ad.0.1779863230247;
        Tue, 26 May 2026 23:27:10 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dba7bsm138308185ad.66.2026.05.26.23.27.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 23:27:09 -0700 (PDT)
Message-ID: <d2098b36-c514-44e8-99b9-2213c4d52752@oss.qualcomm.com>
Date: Wed, 27 May 2026 14:27:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qcom: qmp-usbc: Add support for "phy" reset
 used on Shikra
To: Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
References: <20260526184401.3959717-1-pratham.pratap@oss.qualcomm.com>
 <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <20260526184401.3959717-5-pratham.pratap@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BFrcItzzhibCV16rU1a0jOz2L7HJNjgp
X-Proofpoint-GUID: BFrcItzzhibCV16rU1a0jOz2L7HJNjgp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA2MCBTYWx0ZWRfX6oG48FjruEu8
 bZxlrUr/481ZSo5GMJUhfGK5olkwzpNpq1oE16gFjOvXkg93BwAfRQChvisRe3EJdBOl27eVVcQ
 DUy3AMxULPFIQqhaWawmq62qQxeP9n+insFvideSpDT/lhRCvN7jLuZTy1DYS+30BO2JrU7SI7r
 lfGbe+fKn3+H1ms2yopC7nPW5dOtmK2RMF4GZZXQn9kaSI4oVAwBR2eT+lCdyHAAZww+7DY2mat
 0j4ey7CWSbDnnUiNA4WQW8RalI4903Ik78Y6A+lI79oHMUJJM8AYk/Deiamnz/32BIdSYMQjyfs
 nIFO/STHBEhR6JstdXPs1ME0/6ZibPzb4VlZE7wCMJY/1lxllhMT2RAiJFBlL6YB4V7qwNys4ZO
 v6+munUbQMR0q7VtZd02A1wQTMwGq0DA9wLLzW+UU3yjZ6nfSnFeV6N6tvZnoSwOTd/aWJ1IpfX
 R3srsaxZlVrJyKM5mvw==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a168ebf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=BIqxoA4OLNVSwOVwhU0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270060
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109933-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiangxu.yin@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D7C9A5DFE88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/27/2026 2:44 AM, Pratham Pratap wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>
> Shikra uses three resets (dp/ phy/ phy_phy). Add the extra "phy" reset
> needed for operation of QMP Phy on Shikra.
>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Pratham Pratap <pratham.pratap@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index c342479a3798..067e7f6e5642 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -513,7 +513,7 @@ static const char * const usb3phy_reset_l[] = {
>  };
>  
>  static const char * const usb3dpphy_reset_l[] = {
> -	"phy_phy", "dp_phy",
> +	"phy_phy", "dp_phy", "phy",
>  };
>  


usb3dpphy_reset_l is shared with qcs615_usb3dp_phy_cfg, but I didn't find any optional-reset handling in qmp_usbc_reset_init().
talos.dtsi only defines two resets for qcom,qcs615-qmp-usb3-dp-phy, so adding "phy" here unconditionally will break probe on QCS615. 
Please create a separate reset list for Shikra instead.


>  static const struct regulator_bulk_data qmp_phy_msm8998_vreg_l[] = {

