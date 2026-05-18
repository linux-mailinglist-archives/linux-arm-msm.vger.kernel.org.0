Return-Path: <linux-arm-msm+bounces-108093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gAleGOi7CmrG6wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108093-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:12:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 592F15673B9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E5E833001A55
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 07:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B003DEAE3;
	Mon, 18 May 2026 07:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BzT6Trot";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gu+0q5WJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F973DD867
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779088354; cv=none; b=KUwDsmwYm/KkMLmbx034fqHA7eeGmcc7sYhEDUxtPADmP37hSGgbM1wlnLClyGHUV/kE74ve3OWGk+9laDds/tVRg+PHmYe/BS2dGT4EBrMfnZ3x3S5a3N6PdFTZa8gI8V5x8NU3mXirzYnI4NGwpaA4fnx/6+Gbi0TisgEzLco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779088354; c=relaxed/simple;
	bh=sOyUZXU0M8LCF0l8YDifaBMCboD1LsRp7L4L8rBS/n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GJ5GuaXSCPWEyt3qhMEJis24Z7LEWc87BohyNw9dkjUugq0yfJ91CBoIuDsKc0RDS5yK6XhvcKdbTFHY0UfmkOlwmTVTYRl0WF/8OO7jftTzFP/PeiH3wZjGuzBZi6WBtxAAA+f3JgfMx8f2cVrxpIusjgUlJVkyoYH4haQlc+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BzT6Trot; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gu+0q5WJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I263ZD2332280
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:12:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jfANRrzjnT+Q+ZHPpFu8GhK4
	5mmoeXo/f6F+ss17r/Q=; b=BzT6Trotd5u9HHH25cnEIT2yhiw7itO6Owqc4i5U
	PnnIM64E0CxUp79f997OXg3LqdcG+QaDHaYReatdaPk7KN2VCxLHqyFAksM9GcZe
	/zeUvuUetV6D+hb4OprZ0FdiuO4m+QqsW30Zvvp1MH+jch3kmENSlDS8HXAliN8d
	DyYIC+kmBoflHB95VLdCCGp3U2I/Hn3lA8tE5Y8VTQnl9smFjOxvSAvdYAmIHnGZ
	UycVOdih4ue9a+KV6SL8xh3oz+IsUxPKLeX+9Uo3aRGy8ZpDbnAqDnauvMEK1E6V
	FJ9uRQNj/9fQaeBCWygu1yc1RNpGJzckgvw5gI9z6AuToQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw54rq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:12:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1329791f18fso3164249c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779088351; x=1779693151; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jfANRrzjnT+Q+ZHPpFu8GhK45mmoeXo/f6F+ss17r/Q=;
        b=Gu+0q5WJjXQW2CITds8fOKHDL93hTGlsRRQGYKyjE9Eh3j11yGdq+OFj6M6tNBIlo+
         J2AZ+SO9PvtVymdHJrVZP5eje9kxatYUbUdb8QuIJcDRNqc9xbO+dZLt37b4KTPKyJUb
         oTiO6u2v/3z/cmUavm0CdnNY8mjDr1h2Ma0eu0JDRnBwIaC5q3pjYZBBKw+M9UUdjNDL
         hOUEqYhZMXrm3uXnokQC3zh1ltH692jo+P7BtcuNU3XO7VKr9QZw9EC/pA/wderrKXH/
         ArABlUkAa080FuKXarJlePVL4wuda6bKbjSNZB1OZTVOn7M2WKHqU2WostEa2ZpGdyzX
         WKlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779088351; x=1779693151;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfANRrzjnT+Q+ZHPpFu8GhK45mmoeXo/f6F+ss17r/Q=;
        b=rGWmh8oNlpNuBr7PCuBZrF9IAbM6FXi0rEEB8Ppju2KAeaSwPkRk2vC3gQJzFMoZLh
         LY7CN53xOmzOituh8G1zNx4K4O3zLV5N0Og2Agecjkp+0+Tg8UsWAaQupZYcd0q5H8vb
         f9VhPLwu3Ji5hfr6SllyU2QRol0/zdnvJio9GG1Lxfo8xKwatvlqiCVdCA2IEHvlirKJ
         Vn71BC97JYS2valot96XuD9gLWYchdm0S9pvKJzK0JoyuF3+HFeh9z731EB5m3Kogfto
         WXGSydgU3LRQkqZWfUuDi5E80r90pM/i4maLGRJ5OayYophvogwKH5ojEwrxoquKNrhR
         LLqA==
X-Forwarded-Encrypted: i=1; AFNElJ+oMc9zFfWykrdOnrfPQCNvbzQWknLcrALHg9LHlbeB4Pes1UjDVX5CXJW068m3GdE6iHrRkzIGw6XEkNK3@vger.kernel.org
X-Gm-Message-State: AOJu0YyyQ8ztX0+Fxi81lqeuDDu4Hkg8ovc6mAjNS2dG2KHvXWSV3G5x
	CDhxUE50YUC9aGg/1gX+ZlzOAzUnzRbbn0oBWSyMT1RjUqIBHlvP7zHn5ovcXUaavVR2dW3c4F1
	C5JJUoCJ43V7NVcXG78SBzwCCwMXUyq0hVcw0ldoNT3clVKLqmr8HcnWEYSjctfD8bu6k
X-Gm-Gg: Acq92OEEOgjJLV3LlGVmgxcXK5HKrAIQHyWoy6adCr8FDhNaAgEPc1NYDIOpPacJ7bT
	qxczvUqzfohL0sRunLyD5kZaHFRleXncoW1wG2RRxTfOcw/KQ3EKZ/TmWBQHJzXFge/4xIMnjtS
	qCoGu7Eg7oy8Cuw2nMpxbPhw+MJhIlrub/cCW1KaH/3A50+Xq2+BtXgML5qFjs7HaHqUOQDrcR7
	RdO4qvCLVRCwUOnXQHE4uoUNwTxxwzj3Y4glhxbxacVuEBNLCQFVbCHLm2BUkdjYptbvU/+LUGI
	rPB8C+Wo8rPin/IAWZD6HEYQK6anwwZ2MdItUoqI6l5o0d97jd6adsj8TnIacr8ZcSCM1v0Ho1k
	0dDQvcEUkPMeNtxK73Tc/K5299x4udHme8Ja3DRP/BLp4r6AmL7yGz0Pyi+qUH4Qykhpi
X-Received: by 2002:a05:701b:220f:b0:135:a6a:fcb9 with SMTP id a92af1059eb24-1350a6b09f3mr3264533c88.28.1779088351094;
        Mon, 18 May 2026 00:12:31 -0700 (PDT)
X-Received: by 2002:a05:701b:220f:b0:135:a6a:fcb9 with SMTP id a92af1059eb24-1350a6b09f3mr3264523c88.28.1779088350407;
        Mon, 18 May 2026 00:12:30 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm19612062c88.0.2026.05.18.00.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:12:29 -0700 (PDT)
Date: Mon, 18 May 2026 00:12:27 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v3 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <agq728MVNgDdcOVP@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <e495cf7c-a76c-4ecc-aa95-36fb0ee54b80@kernel.org>
 <aglY9of/4714us2o@hu-qianyu-lv.qualcomm.com>
 <e72e2f53-caba-4c53-b494-3c284eec54b4@kernel.org>
 <agqJCmQRmFwhFClV@hu-qianyu-lv.qualcomm.com>
 <5ad0685b-9ba4-4ada-863f-4e5a24a761ff@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ad0685b-9ba4-4ada-863f-4e5a24a761ff@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2OCBTYWx0ZWRfX/VhVrRiYYDSa
 Za5JOYAz0Z62mw9ogcBCvfCq74syzRWr/l2veamuHy5Jd3Bqi/4MxwVkY6lXZCmynyAq/HzJ5DB
 Vw2iVtfJLTPIXTKDYahA1nb0YQ1UqyDE/EAu94jE8get4S5EL9sf8dH8/i6t9E7NVVuG9+A+G3T
 ZvRKz6SXbeUNZDaa9quwVYkr7aQ9i6dsX6g2t9p+mTHN5k2GtieNN691pf6mfogk77nC2MM9+8r
 e1+tlegyd44am/QV7oGk47L7dpdW/Lef2fUaUA/3xpogpw3uxvdMRqaCWo2SEVqQ2ztopiMvHgO
 1Hy/ACEYV/oqa88DCzXtzAtgy47xLsnNOlMi4xWKw62CeCnmduKqvD575tp6gH/v4BLwEHzFZXl
 DtATuzC+rZC6UD1lf8gXkC1dWhS0hG0EQ21PqayfcuaxNxgWHtpVS6drciEHhtEoo+pi4OyOCpr
 SESq49ts/oeO/SsXoiw==
X-Proofpoint-GUID: 29QvQGEuJUklKZoqAGz5CBnPYMuyFJHW
X-Proofpoint-ORIG-GUID: 29QvQGEuJUklKZoqAGz5CBnPYMuyFJHW
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0abbe0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CCvEkRsrOX1Ipr2nmxMA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180068
X-Rspamd-Queue-Id: 592F15673B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108093-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 18, 2026 at 08:59:14AM +0200, Krzysztof Kozlowski wrote:
> On 18/05/2026 05:35, Qiang Yu wrote:
> > On Sun, May 17, 2026 at 10:28:48AM +0200, Krzysztof Kozlowski wrote:
> >> On 17/05/2026 07:58, Qiang Yu wrote:
> >>> On Thu, May 14, 2026 at 12:35:19PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 14/05/2026 12:22, Krzysztof Kozlowski wrote:
> >>>>> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >>>>>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >>>>>> required by clkref clocks.
> >>>>>>
> >>>>>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >>>>>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >>>>>> differ. Document them here for qcom,glymur-tcsr.
> >>>>>>
> >>>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>>> ---
> >>>>>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>>>>>  1 file changed, 57 insertions(+)
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>>> index 1ccdf4b0f5dd..57921cb63230 100644
> >>>>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>>> @@ -51,6 +51,63 @@ properties:
> >>>>>>    '#reset-cells':
> >>>>>>      const: 1
> >>>>>>  
> >>>>>> +  vdda-refgen-0p9-supply: true
> >>>>>> +  vdda-refgen-1p2-supply: true
> >>>>>> +  vdda-qrefrx0-0p9-supply: true
> >>>>>> +  vdda-qrefrx1-0p9-supply: true
> >>>>>> +  vdda-qrefrx2-0p9-supply: true
> >>>>>> +  vdda-qrefrx4-0p9-supply: true
> >>>>>> +  vdda-qrefrx5-0p9-supply: true
> >>>>>> +  vdda-qreftx0-0p9-supply: true
> >>>>>> +  vdda-qreftx0-1p2-supply: true
> >>>>>> +  vdda-qreftx1-0p9-supply: true
> >>>>>> +  vdda-qrefrpt0-0p9-supply: true
> >>>>>> +  vdda-qrefrpt1-0p9-supply: true
> >>>>>> +  vdda-qrefrpt2-0p9-supply: true
> >>>>>> +  vdda-qrefrpt3-0p9-supply: true
> >>>>>> +  vdda-qrefrpt4-0p9-supply: true
> >>>>>
> >>>>> Either I do not understand your previous explanation:
> >>>>> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> >>>>>
> >>>>> or this is still wrong. There is no TCSR here, so this proves nothing.
> >>>>> If TCSR is TX0, then you do not have five of them...
> >>>>>
> >>>>> My previous comment stay - you are not describing the actual hardware
> >>>>> here.
> >>>>
> >>>> And it should not be my task BUT YOURS to verify this in hardware
> >>>> programming guide or manual, but nevertheless I did verify and the
> >>>> manual DOES NOT mention these supplies. For Glymur, it mentions 8 reset
> >>>> ports and 5 clock ports.
> >>>>
> >>>> No supplies at all.
> >>>>
> >>>> Then I went to QREF and it does mention few supplies but completely
> >>>> different, like mx, cx, px 0.88 and px1.2, so none of this matches QREF
> >>>> either.
> >>>>
> >>>
> >>> Honestly, I couldn't find QREF LDO-related information in HPG either.
> >>> However, you can find it on IPCAT. For example, in the glymur power grid,
> >>> these LDOs are clearly documented under the LDOs required by each PHY,
> >>
> >> How is that relevant here? This is not PHY here. You are adding supplies
> >> to TCSR. Do you understand what a supply is?
> >>
> > 
> > I'm telling you the fact that I see from power grid table.
> 
> So you see supplies in phy, then add them to the phy.

These LDOs don't supply to PHY directly and this is why I was taught to
add them in TCSR.

- Qiang Yu

> 
> Best regards,
> Krzysztof

