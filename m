Return-Path: <linux-arm-msm+bounces-93363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LO+IVHilmnkqQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 11:13:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC7D15DA4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 11:13:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7D7AA3012258
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 10:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116F2311C37;
	Thu, 19 Feb 2026 10:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LORC+pTb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJD4Jdug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA14F30F921
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496015; cv=none; b=rivrr95Pqr/J202+FlYMYPE2GHI7KdNw+9N0jG0cmMMCTqoKRaIEDvhOivQQWIeymHtuDQYuN+tLDY2+0dJ6FhT63DJfW0cO11MIWmvZflnrFxEloW5nrOn9vDck8nIarjCVifMf1y1mW1Q0FQ7a6blsRXZuUV3Ap2I0ufirnts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496015; c=relaxed/simple;
	bh=KCfJHDS/PzC93Ntrc5sBNnpHbOTr8W8PLOd+69Xbwm0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTcPHMwTWZgSePQqtvzIIunSHqmir/XKfM+9FS1ldMk91Fhya6LNuTP5vgABLVOpSpgm+EBDJoF6VGa47QvWl2EnCSgriX+VB5Q/jAx2CV8ZT0856s9v7aAK5EGuEitQ5bwqWkymUJgpizQXrNxdFPHYRWJlJen/r7RbveTrEkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LORC+pTb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJD4Jdug; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61IL5coA2004670
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 10:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5qYijRGhC8wgRA9I7JDYzEt6
	ywiJkqnqcVz1mpktL9Q=; b=LORC+pTbXue6WOUjy2w9qHGI1TNm6GZV2i1w5mk+
	CHMVfMX4L/iKYO8C4p6FE47TTdpPfOEGt7yOBrwOdNRqQKbsASdmZP/STNajyxcB
	8tJmU0QJVig+EoUJCmtzTOkLEcOOzmZj4EP+aIMC1jDSZIOpQo4etd84Vzh25CMK
	Fg+9GKjkC0y0W2DGEJXU3vZhg3p3CawPM78gB2m2dB+0gtChuWrSZCqGoH59pygm
	iN7vaXfOqT2E4+jY0OSvB1oUpDlmI6IMnrBa/Amg2qeN8+TdXnVyShX84c7a2U8r
	hWR3MoX8gvI0kWZtsOJnvJscXzBu0Q+CcitQGMAnn4btKg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdn1qhh5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 10:13:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso1036434185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 02:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771496012; x=1772100812; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qYijRGhC8wgRA9I7JDYzEt6ywiJkqnqcVz1mpktL9Q=;
        b=GJD4Jdugfpp1+qUTIcIXAyp+jYeuW3p+vASwwse3bE7oylG9l87SFToIxf2NmDcAqt
         vo2p+vboat1CTZyk0OhGfU5/y2FHYbu/ARehB80HUG/aX+fVnzy5LtC8u3osWAXdTQmn
         w7twOaVnDIb4174u39cbAb0Mnq6X88pfLb9dzIjkAHfDNIKoff8AqHUFejXuXvJrYIVo
         hzA+M5YzzQXb5TnqPm+NizUcvWtAdRtbtgeL/oEzX3wA69x5wjzLnpKS1APiIPmKENgf
         8qNaGhr01WFwmX4aWYUhzE3KVZeH23L4KioFZ+szzMsc1MdIqNEfxwi2M+/bvQMeSdIS
         Y2XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496012; x=1772100812;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5qYijRGhC8wgRA9I7JDYzEt6ywiJkqnqcVz1mpktL9Q=;
        b=qiPqYN5cpQ2lBLuOEsaWAVp1KA2e8+VbLa04dAjfkCxycdLvHQR39dXwFyIvtMF2xA
         QBFo0080FhjquuBXdiKq+X8T0wjAxu6vDaAfl427ZowFb3EJxrs2Rqw5IJF6nTI6X7tp
         qDKFuFWMsCq7FnD2HqTlx4e0pKTPOWUTiTbUHHN0tp/zN0eYeAt/0QYfV1cdYDPp0m4f
         pal5PVUzKaxYqF6z8OoEgayK1hP/H8WfA50qVeNZqsZ9mAzxEJEzP2yABEBZbqqAYAWt
         gWkOTYwcPPDuoLTjKRVLEmr/LVZO9aYQ0Sb/kd0bYd02RMhVDEHbMa56eGquwmCYN/RS
         5HCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo8wRNCdnlBXiax3S6LKChbCjyBjOxLRR8lyeNH5PPzFIvHWvn6XvyxGF8aCi06Drj9wl3K2n9sCtxoBAh@vger.kernel.org
X-Gm-Message-State: AOJu0YzKXaQSzDRJJCcxTnZU1OtpH/+QcllfH5vpm/y1dTefrFs4Gg7e
	oA5cfKPvb38dCILHrAaHf89ZZwVqMypWAjdUVqu3pVvJu8xZezn/bVp/e8dB75+thyrvKlRTtwt
	TBU48Hi59gFvznC0iYfZBuzF4tA6bjMv3Vj+DpPbAxoJ/3UeZwb9SKqFOalvvZYbdc3W6
X-Gm-Gg: AZuq6aI9+xEjP3H4td9hLtM7bOv2Q5TzLdC4kJNAg3MlpFWN+ow2c/U1jzVeuA4tkTT
	+b0j8S+YsvKTkk6RoADDQffu7Go+AVqvUXxsfiGa11lV2ZB2b8yYNagln5jW16AnMlCDleYzYBs
	Mjz3X8RnICoqNODzaub417F7oobJfMCgInd2md6Buxt1QF3FAytQHv3YbsBQZvSBoDjAQp8uxks
	Jr3+3N/JOUg4TC3MBtFA2ioAjHCNM56K2zIzmrefviNl+7ACgxHA5Zy3XhYWBiFN3tGcVBYyG1Q
	0xq2G6mWoMB14+FKiNzZLS2EX/+r9Pjp26BdqYBtZxA893ky1ZKp8tqRA1Fm2bg0HCBTW2XPv9O
	d/SWtbAzo9BLrm7V+iGRFmWyEjuNpE4XHrBdh09ZipO+W1cj0iOEJPt6wck9cABe2sPiRkOv856
	PFtfslzaiccxPa86WMoOYwBKQUKbHS/eE0oAs=
X-Received: by 2002:a05:620a:4010:b0:8b2:ea5a:4152 with SMTP id af79cd13be357-8cb4c019b85mr2169287485a.87.1771496012047;
        Thu, 19 Feb 2026 02:13:32 -0800 (PST)
X-Received: by 2002:a05:620a:4010:b0:8b2:ea5a:4152 with SMTP id af79cd13be357-8cb4c019b85mr2169286385a.87.1771496011682;
        Thu, 19 Feb 2026 02:13:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5a4f82sm5195866e87.50.2026.02.19.02.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 02:13:30 -0800 (PST)
Date: Thu, 19 Feb 2026 12:13:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sm8750-mtp: Enable DisplayPort
 over USB
Message-ID: <sqmqj43rfuan5e5hwti66ssj3k4bgsd3c45uxbua347cywi5ek@fbhwood5oahs>
References: <20260218-sm8750-display-dts-v4-0-1743e9848864@oss.qualcomm.com>
 <20260218-sm8750-display-dts-v4-4-1743e9848864@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260218-sm8750-display-dts-v4-4-1743e9848864@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 1ndGc6iZUVe2-LNHIWyQB0VBOD47I-Nr
X-Proofpoint-GUID: 1ndGc6iZUVe2-LNHIWyQB0VBOD47I-Nr
X-Authority-Analysis: v=2.4 cv=c7umgB9l c=1 sm=1 tr=0 ts=6996e24c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=xgWhb89BDjTtD9WMArQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA5MyBTYWx0ZWRfX9PAjUAUvaur+
 miw0B35Y+Fxz7/3yVgHE6CcuDSohKfd4/XJ2o7yOnIAH8JlDmnE3Gfav71iZFmwyHIRnpp0E/5T
 sLPTR2ID0oWe7ceWabpe8zwxonS4z2jSrgzFKHcFZxa/Ba2qOoKuprT8zFr6Wc47mzxtoTI8Cou
 HxrgyjBuqGIbvsQLFrKIL81jH1pUhGwEc0KWEyNTt/XAHPzN6orEdSGIVZyjOiZgiZmKgIwUutK
 I0aqHywrIJ2lQHwq1mKRsGamqvsqZ4tCRwq2loJGEeSUC1qIfkJOiFZjdMQs9Ea8Qsg17IiBvYo
 1/nJss92MtIUY4IKuFTtzYbcLo/EbEejib5itNdlNkMqMoBW1ZN9DRgAfkGjYRa7PDKdKf1kEjE
 3NaUWlV11B5+rbSp2WTRg8qk5Tz4nDMwj6dEuADtdM+l6lHab35tKDWcn63r5HnkvQuU3QVZ3Ny
 LpnzD7gGqKCv1Ybb7HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190093
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93363-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DCC7D15DA4B
X-Rspamd-Action: no action

On Wed, Feb 18, 2026 at 06:05:45PM +0100, Krzysztof Kozlowski wrote:
> Hook up DisplayPort parts over Type-C USB on MTP8750.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
>  2 files changed, 10 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

