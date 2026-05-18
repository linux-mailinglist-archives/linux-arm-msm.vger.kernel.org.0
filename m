Return-Path: <linux-arm-msm+bounces-108094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNDYKTK/Cmrb7AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:26:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E17B5677F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 09:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3BDA03006B5D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 07:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7588631F9B5;
	Mon, 18 May 2026 07:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eOYl2Mf3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RKRde2+/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088263DFC6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779089193; cv=none; b=pzlbg+nE40VUbr0u3dYxcixp090SP/LSdRbHqdXXiramZXqFnV1NwjmKG2Z0yDh5Wx7X/cWpdqL0bFh58DO7h7i4qpcl+EUdqSyX39G7tPWO+3HFSuQNf+Y4ML2ia7PODcwdZlFZDSFOCXkZ+FMvgSf+aesPnYFxmexVlh93/kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779089193; c=relaxed/simple;
	bh=BFLT2sMKZVbvrXzaGurqIbvGSBIHgB35MLJgnq7E054=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ag5tJd7q/ePtnBT26Pj5XyIa4aR9DJGKIbcakPx9+iuxCa0UsfHCozCFaEu5JuU/BwYpZyYfhIbfrsmuzQieoJiQmMkcl44QB96g9+P2ghzXcszFQlEB/hM4CEgU6AONTg+hOve9fHgb7w0hPVMPoWud94SET8DV8lm2bot4C8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eOYl2Mf3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RKRde2+/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I26YpU1462932
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ucnoUt5TTho0FOav51RvQTc9
	B7fXpvFXnvdL/+fsk2g=; b=eOYl2Mf3VfMDvFaerDc9SCzd1gBvFRuDITQcohz5
	6t5QHpVpBFByOB1X0GPjhoetdosfqcmavX5R08XqgTwjptGQzM8J3jtVHZ05H9mF
	wIp1YwQkQzbCCiFEQjkhDhmkk8M7JM6WkoXLmL8n62G+oXRd/fJCSC4lmqp9Yge7
	dTHdLO37eftCvwm/v+vV/pSSl/pDIFTlfLHSJJfRg1/RC5Er2RX0kJj27z6F5ffw
	lqO1va3I+G6QHJ8vePelu9TnunaZZuF6FHR3COFL3mFeWS/pFr+4d2Bz6ZCAMF15
	lMLwJ9xkSzroIUOXLDaWogIJR8aNeWOCWcRzJ6g8agYVIw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0g560m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 07:26:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ef62078ee7so2734588eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 00:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779089190; x=1779693990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ucnoUt5TTho0FOav51RvQTc9B7fXpvFXnvdL/+fsk2g=;
        b=RKRde2+/p/xBLJvpLGgj2eKAb7hqV0MEeOoYv6myTSvkq8tWRj2BB1hh1uvrJBhOxd
         CFRBDGpblmPXWHgb2PIB9pc1X2N8/+G/toKFRP7QuEOxHlKiVf8rjmipAe7fRCOIvCrw
         3nBC8i/jRRrJNf7x9fvv+K2/cavBVqD9WlstGDr59mOsQAYfbchc4d288YQexrP7d38K
         0xHRrjrF6jZsfgWAmOXp5pD3WPShQaQdki3HZ2Lp5fNuR64Wt9U3efWl9BmxS5cwMUFk
         +YZiVtRg6jJScqyhWBz+jhsv8JtSSEfl7nnbdqRFpsAlVGTFLI1eaXOovXvpeOT5tPFF
         2iBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779089190; x=1779693990;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ucnoUt5TTho0FOav51RvQTc9B7fXpvFXnvdL/+fsk2g=;
        b=H0SwdOzJxhOg1mqm/v/b85bqe1GjmaBDrdLgHpIatlKYoawMUtLm8LFOaBmmy8gF1P
         +qdtEJNhnSSVi8JyFFV8kSsDKaWYgDqqXLg1MGnSHvH8kyIIspBq1OUWgOTMVjzaklwq
         mLh97pGIiWoDEMJNZ+M+Kjj7ezRGQEvgttgtT+oNHDiDGc9fiiix8ouEV7a1vSezxwXB
         ScmBSAZfqwIhJ8Wz8IQylyEO9nCiQhfDPae1+5rRRkrRQqRVaKiijivKAO0uwErkcai7
         UfyB5GJ3ovUM4MxmOh4p5hsckdLpyUiNtOEf890zpN9ARWUHdvhBU1UjiOJxoY+mTRJI
         5x4w==
X-Forwarded-Encrypted: i=1; AFNElJ84pPC4k0m0tcaU7a7E2LcucG3TRLqK5uxreKBwtmkYJckk7UZoHaRn79XsqXcUeZlg7ZLnN5HTONnNGY+8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp6tQe1Zs2t84UDHOufO49KIP0vZtqM7GmCsTJcjkvIwOsNZv/
	NSpEGvAkqDWp/BbCVtSgrVGJZ6lNQt9T/HNDPW/Kvhv7aVuoL1I5IlOVPXYpeJvVLDEmo+Cmqsa
	fruQjBrI6r1gJyMRXf1VcGYrxBJN8bn6k0XUD9clKs3iEH+qHDK8QcS2c2ppoddyjROeh
X-Gm-Gg: Acq92OHPfbydVldN1d3R7F2FnDQV8JiM8vHk93c/tqBtWiMTa4eP7zyEGgnKev+raTN
	pCCeXDZTy3YOxnDEDZFu7qB7JIVDWRyx2HhJ8a2d+bs8OSgbakNUfAaajnN5oaOOd+IeTyyCE6w
	hwZp7/ksow9PrlqKsdcjNmrLxi30TxVTa/omJQW0NnmWhDIW71cuomRjh9r4CHJqvYN+fQz58xr
	8djm7tv5mN4cM1XhUAoqcr3Fwvn05ZMssJLqejPVMpERp8a7sbW+HznrRm7LYcp4TjKIH8V3wG6
	1g4w2nPm4LPBJ8SxagG2bLRVIfDb061eLTtjt07V27eAdPok3ugLHcp36r3V+Qe0emC4Fc67L5C
	OzNU72obp7D0K/9563j0dBcglKDRgNaimCU0LPSw47DwsdB0PMtviNU6ANd9AB1vGUTop
X-Received: by 2002:a05:7300:f187:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-30398699534mr5640415eec.23.1779089185969;
        Mon, 18 May 2026 00:26:25 -0700 (PDT)
X-Received: by 2002:a05:7300:f187:b0:2da:1874:f3bb with SMTP id 5a478bee46e88-30398699534mr5640399eec.23.1779089185464;
        Mon, 18 May 2026 00:26:25 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30290c4a699sm13409001eec.0.2026.05.18.00.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:26:24 -0700 (PDT)
Date: Mon, 18 May 2026 00:26:22 -0700
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
Message-ID: <agq/Hl8qWn6wpbF4@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <aglUmonGmr2goyOI@hu-qianyu-lv.qualcomm.com>
 <408f587b-76c2-4fdd-bbe1-89414270b4ee@kernel.org>
 <agqMgkRwKqr05rms@hu-qianyu-lv.qualcomm.com>
 <bbd5e74d-99c0-4a18-bc80-b3658b235bf6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bbd5e74d-99c0-4a18-bc80-b3658b235bf6@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3MCBTYWx0ZWRfX8Ag0li9glOZ5
 KUJS+NSSfJMOQFUT5nT61HGM17C2yP4BqfiR2PMTtcDvqXh5Betf57008ZWcLf4wmOcDW5HiXg6
 p70JOf5fPW/q+e51aoICKZSDCu32aHRvgSHBobkrv22PrFVdMiW80KDmYE+DR0hJ//UM+GRmuH7
 66Xz33jJHvVLVMzmXRM2K31QYmDR0Ur8AjKII4ddY9liQy+CAoMYpe3OCMeyvczj6Jc6r597n6G
 sjgEzgSSZhkh/vrxeU1r0q0me0OujjRkKhsGHqdGokTBzklhdn84jEfPn+ddAXxqE0hLk3c8RxZ
 vcsWrept3XNOk7KdMzYVIUBDkcNo9kZFWP1Ueii62B1XKVuGNGGKDzyiUcl8BwE9xdf8j7AXDR2
 KdHNImpv4IN/CU8e8v60NqrZwYCUG+6rogM5ZIfUYdSkveNICzEOTZTfbBNSA1vLaUhBPpBPRqZ
 R6ead8SV8G66aXJtr3Q==
X-Authority-Analysis: v=2.4 cv=W7gIkxWk c=1 sm=1 tr=0 ts=6a0abf27 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Wj26GNSjI57I_fwXRWwA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: uWLLV7rrOzNARf3WZzZRJ72mbaR2nrUJ
X-Proofpoint-ORIG-GUID: uWLLV7rrOzNARf3WZzZRJ72mbaR2nrUJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180070
X-Rspamd-Queue-Id: 4E17B5677F4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108094-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

On Mon, May 18, 2026 at 09:00:33AM +0200, Krzysztof Kozlowski wrote:
> On 18/05/2026 05:50, Qiang Yu wrote:
> > On Sun, May 17, 2026 at 10:27:39AM +0200, Krzysztof Kozlowski wrote:
> >> On 17/05/2026 07:39, Qiang Yu wrote:
> >>> On Thu, May 14, 2026 at 12:22:17PM +0200, Krzysztof Kozlowski wrote:
> >>>> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >>>>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >>>>> required by clkref clocks.
> >>>>>
> >>>>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >>>>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >>>>> differ. Document them here for qcom,glymur-tcsr.
> >>>>>
> >>>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>>> ---
> >>>>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>>>>  1 file changed, 57 insertions(+)
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>> index 1ccdf4b0f5dd..57921cb63230 100644
> >>>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>>> @@ -51,6 +51,63 @@ properties:
> >>>>>    '#reset-cells':
> >>>>>      const: 1
> >>>>>  
> >>>>> +  vdda-refgen-0p9-supply: true
> >>>>> +  vdda-refgen-1p2-supply: true
> >>>>> +  vdda-qrefrx0-0p9-supply: true
> >>>>> +  vdda-qrefrx1-0p9-supply: true
> >>>>> +  vdda-qrefrx2-0p9-supply: true
> >>>>> +  vdda-qrefrx4-0p9-supply: true
> >>>>> +  vdda-qrefrx5-0p9-supply: true
> >>>>> +  vdda-qreftx0-0p9-supply: true
> >>>>> +  vdda-qreftx0-1p2-supply: true
> >>>>> +  vdda-qreftx1-0p9-supply: true
> >>>>> +  vdda-qrefrpt0-0p9-supply: true
> >>>>> +  vdda-qrefrpt1-0p9-supply: true
> >>>>> +  vdda-qrefrpt2-0p9-supply: true
> >>>>> +  vdda-qrefrpt3-0p9-supply: true
> >>>>> +  vdda-qrefrpt4-0p9-supply: true
> >>>>
> >>>> Either I do not understand your previous explanation:
> >>>> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> >>>>
> >>>> or this is still wrong. There is no TCSR here, so this proves nothing.
> >>>> If TCSR is TX0, then you do not have five of them...
> >>>>
> >>>> My previous comment stay - you are not describing the actual hardware
> >>>> here.
> >>>>
> >>> The CXO network "-> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 ->" is referred to
> >>> as the QREF block, and each component is controlled by the tcsr_clkref_en
> >>> registers.
> >>
> >> Still no clue what this -> relation is. Again, describe the hardware.
> >>
> >>>
> >>> If a PHY receives its reference clock from QREF, it will have a clkref_en
> >>> register. However, this register may be located in different regions
> >>> depending on the target. On glymur it resides in TCSR, so I added these
> >>> LDOs QREF required in tcsr yaml.
> >> Registers are not described as supplies.
> > 
> > I'm not descirbing register as supply.
> > 
> >     tx0-0p9/1p2  rpt0-0p9   rpt1-0p9    rpt2-0p9    rx2-0p9
> >        |             |           |        |           |
> >        |             |           |        |           |
> > CXO -> TX0 -------> RPT0 ------> RPT1 -> RPT2 -----> RX2 -> PCIe4_PHY
> >        |             |           |        |           |
> >        |             |           |        |           |
> >        ---------------------------------------------------tcsr_clkref_en
> > 
> > These components(TX/RTP/RX) can be disabled/enabled by tcsr_clkref_en
> > register, and they require power supplies.
> 
> So I told you more than once - none of these are supplies to the TCSR.
> You clearly misunderstand what a supply is.
>

The TCSR binding here describes the tcsr_clkref_en clock gate, not the
TCSR register block itself. The clock gate controls whether the reference
clock is forwarded through the QREF chain to the PHY.

The QREF components (TX/RPT/RX) sit between the clock gate and the PHY.
They require LDO supplies to operate, and those supplies must be enabled
before the clock gate is asserted and disabled after it is deasserted.
This enable/disable sequencing is the responsibility of the clock gate
driver, not the PHY driver.

Since the supplies are managed as part of the clock gate operation, they
are modeled as properties of the clock gate node. The node happens to live
in TCSR on glymur, but the supplies describe what the clock gate needs to
do its job, not what TCSR itself needs.

- Qiang Yu

> 
> Best regards,
> Krzysztof

