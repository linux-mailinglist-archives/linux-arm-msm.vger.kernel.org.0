Return-Path: <linux-arm-msm+bounces-108482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6InuISVMDGrjdQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:40:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B311457DD1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:40:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1ADB7306EB3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:27:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A824968EA;
	Tue, 19 May 2026 11:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9S18bOn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iapyL229"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C60332B131
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190039; cv=none; b=fY6GE9aLqPk7aX06t3UGbQXZrruC8D4pUBgUkKE6gnk1+NQ+4jdFEzl4NkxlIieOKyOAicjDWghcHipypeGAiLHz1FLXF/aRow036mCp/BuGgfTXgdUNK/p97ObsWAW2bWZZATB8Bob+sw7mXe1lfrOcKHqEbAdbmkCI9ub+n9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190039; c=relaxed/simple;
	bh=o8d25J2khhRXl66J/BsGcm24W8v/vKfxRKzSLM5m768=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sXrB2i933I+OZWIVuM13NrBfw4SFHgjbj14+eic3Hol0Cl1dTSG+Icy/I0wmq1HRjVQzyQrpZOBBOucGKWhaXQ0wNBw5FO7pKriAkHdLAkz3mxC3wbTn933XAu5xi8Xj9mi0m8iuvf/HLdqC92NaOu14qHfjJ3GUcYC0hq3YSl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9S18bOn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iapyL229; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JA34Mf1392941
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=; b=Z9S18bOnED9QPIPe
	vPgMj6MAlYOE59JLioS+2zAREr/uN2PthQNTCgTpVbJt25bNtZBuWIIAM9p72Jh1
	HS/iBlj/PvBshLMbglw4vx4Q7P+bTEEP70kVRMbIh9Be2DXkv4Q8av1z+z/aeHRH
	6T7gvUJQWTvVrB/yO+K61PjCuJ3kd4JnQO3nafNxUvbmTcW60NZ/V3eNer6AYlVc
	ZeskDFvqFQl4+q6wLVS2jED04sDPdN9TF0MiNYoyRoAcFdTxyRuE1z4zXe1CEgTt
	57egWu86yyafw1ZSRZhBeOBKNXgH6w7DKEDdv4D5t6RS6rAgz8m5sL14oRdnxYf+
	1KjHtg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8ns48aet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 11:27:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb0b93e90so10710861cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 04:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779190037; x=1779794837; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=iapyL2296geMcN7dNN5sebk9hsiVBpHXMJoqoJ5E82nJOnXh9K2IWHRTQr20UgwblZ
         eACLpSJ1Ew42QS76hWYH55QZ6NN4hV8xzUWCaLX0KeVmVC5wXBZeTySnFICN8QkzDE4N
         PjZf61rMZ0/2nH76bdy26Qay335b7PbrptqsSAz67Hvpp0CxXCyKH7D9H8ZBI1IwrZ1s
         vk9XNYN8Flx7WVVxfiCvn+f7aH1HU01X9bCCZbHymBOdd1ibCD0z2/xMizri1lFcNN4K
         +BwbOcEshmOQ5UJFDjzNxVkNFbJualVs8LaSYyUvYLVLrJ1S1B3iANLu7VCu9y5atSNL
         8ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779190037; x=1779794837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAuWBKJNcFohr6xfz8/FHkHwgZoPqqBUJud7P94kK5s=;
        b=QX135E4tB8ERpyG8UISyAO42zON7eEMZPsq/UA0d9MckAxw6Ev3IX4tX4wCzpAP7Nh
         rGeX3HM0KU/hsIYzGr82ZfCyLsUbAQbPRVP2STyo8+5qp/6YmG/CKJy8fZUqMuSZv8Cb
         t/sPydHqmAIKzifHTP1xpgvGvDalswIJ55qkLIKMfKCn6J+mma8ZSPhGv098g+/pdcB4
         /ZRPYwCdeuQ/WvcYmy6mxsAh1EZ9t8+NRslkdUx6PuKTcXFfo1kvG6RYVllEFxJjK/4v
         uaqRU71B3WtYON+OLiGU8GstkpuXklIuL0kqiuWOWg60btbPiPQGQY/QHbocT50FUy7I
         ZWTw==
X-Gm-Message-State: AOJu0YyXsWR4JHrAVU0Adh5AHgu9Iv6lqXITtjfaaRsueKl8K9Sz+PfX
	ZjnpReIPySbOnL2bgGtULo4dfE4Xf4G5K7sEGiU5o1rZ2pbloXAKLzjs8IPdJyitCF8v4nqIK4r
	4Wx3H0y4bMhFh+z8gvbMhk8rI8TQvA+BZpFQmsZhC77NsUJF0iKbr0SnvO+unxyqVbOXS
X-Gm-Gg: Acq92OHJHIGhEmCzeGmafKrD3XsV84rxeS02Q43T8q+EcWGkT2TnIWIP+zjmcPyQwww
	sZTx5rW1x3Sm1i7uJGExq9F5DlqCD9uQL6WUDAa20nRnKzwetpr7ci0QsFvQXmCrf2qgfv9sfaO
	/nIvs6XR2nvkj5o2PiAUAucFQrBzbCH1V94bgi78ezAyKP/rwdSmaLRxyn9r38HI60juxQJlQPn
	gvpi2husv2SIeqklw9fVVl1OGey5LjFa0BbzoOOVm54Zxbu7nbPNUyeYxcZDXW7Xeo/8MD2VzUW
	O8nxR19EpG9D+9LZXznSvIB1I9ZTyQCHX96M6dyHZV00vmpskRw+fWFC1giRW5mwW704MgQGsze
	wAzgZBYWsJjOCO51dc7WJhbPJlxiiUf2IVBRbd3AEbTwg4+uC2NW9i6P2bcs4+uzqr8KMxfVgGD
	zwjxg=
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr207110551cf.5.1779190036728;
        Tue, 19 May 2026 04:27:16 -0700 (PDT)
X-Received: by 2002:a05:622a:180d:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-5165a1db778mr207110221cf.5.1779190036237;
        Tue, 19 May 2026 04:27:16 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c28c0asm707868266b.17.2026.05.19.04.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 04:27:15 -0700 (PDT)
Message-ID: <1e37d962-04ff-4dbe-bce1-1dc1ef655529@oss.qualcomm.com>
Date: Tue, 19 May 2026 13:27:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: pm7250b: move vdd-vbus-supply to
 connector nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260519-fix-tcpm-vbus-v1-0-14754695282d@oss.qualcomm.com>
 <20260519-fix-tcpm-vbus-v1-4-14754695282d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-fix-tcpm-vbus-v1-4-14754695282d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDExMyBTYWx0ZWRfX2sfvfv/mxJHy
 0/8izDxtWuGFWlwhn6E0cjfUhnAHX8OrDo/fLgGPLOESLDzugyVsogSzXchkePUhDvflD0ZN7R+
 f7GZrLR/Ng3l84GEasOBOIg77xZO7dig4iTueZq3T4rkXhj27CE46RFwS3dto+lDY0VqlOj/vIw
 wTD8GdVlXDfvIkcss+Xg9hrVRBFe7KMt05hkpzkfJGoAex3QwHm9nPQ+sKBPqu6Vz7tuhtwiGhp
 zutPjEpx5ZTmcZ8c/qfBqnbqY5UxX3S1CLECPF034G1/HS3gfrVZ9BMTct0FO4ooXEsyKS+7e7e
 6/VmJaYEIW2nDkZBUQStBI2xzdg3GX5UdafMLaWoTpKDM3d8RZLhSsnB/Fc0cpZ+uVkcAU9IcSJ
 E/S833dnU8gTlV/6voRfApObT4RITJ5D7MNTAxxzBHMKOlavvwedO9ymgv2/CgE3FqVyiEYPh8x
 gEfCX7ybXge9aTgechg==
X-Authority-Analysis: v=2.4 cv=F6dnsKhN c=1 sm=1 tr=0 ts=6a0c4915 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6_Sr6spSlTavn73YIB8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: VRfPUKpTAlcXDPTkCJHchgMXBtn9MKn0
X-Proofpoint-ORIG-GUID: VRfPUKpTAlcXDPTkCJHchgMXBtn9MKn0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190113
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108482-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linaro.org,linuxfoundation.org,kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B311457DD1E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:48 PM, Dmitry Baryshkov wrote:
> Instead of specifying the VBUS supply as powering on the Type-C block in
> the PMIC, follow the standard schema and use vbus-supply property of the
> usb-c connector itself.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

