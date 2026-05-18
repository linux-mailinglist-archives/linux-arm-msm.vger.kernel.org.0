Return-Path: <linux-arm-msm+bounces-108084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +JMOGhmJCmr62wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 05:35:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C95657B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 05:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57736300293C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 03:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F9C380FF9;
	Mon, 18 May 2026 03:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="co0QUJ3g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LyQ0KKJv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86523803DC
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779075347; cv=none; b=lvtYrfQbda1XMsPT/gtD6/UZbnGuzsECdsiv1umPInEXV8JXtFlF1/zUjt2BCAN4n78hIQ7PI+IlGS7Z8Y3RJ9PYaLoHGppJKWwpTUayXhEpyKHO8yANbxTZB86Q+jnZAd1Mhrw2oBZddDfU2SNhwOrY3BjDe3sdr459QeqU3xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779075347; c=relaxed/simple;
	bh=kUsbM86mQMkJ2mAiobQt57+EdQcwjJauLynG+k5pNsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLrrbQ9O3ZYCAz82ya6majAx1X1Q/nMy04efx7oLFX+8a7D7pn0yhwvRJRvDb+BXo//J4M2rothhcTnv3O5viWLBwhLfW0Bg1Gc/ipp88h19YtPumINvL2SjOoG3DKudF0kbftC9IEI703Yo6oibBpWZHFrCZFBAk9KL3ztWopY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=co0QUJ3g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LyQ0KKJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HMFFb8517320
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NclULWFnp5Wyf9ypfaWjAmif
	a63DzbbBWf3uDDMhJ6A=; b=co0QUJ3gPSc7AVoIy3sUbXiWxibGWwNB6cmFa4Wx
	Rq8hpk2r8qppeC061O5be9Q80yKQKs5RMOd7u8je0lpg1NtA210iqHYTGXeLEiti
	DE0zpECOP08qkHaMcbEgC5CqTkV7D4uKrwDNcUtYlVPnXQv6YwJOtG5NptelCo5z
	NACTSS6pXvKZNBhEHbjPaaZB32TaDtxLxDPeKkLYGcPF25X1WoasiIS/Xj2wHjPo
	zpRI48HoqVOx1HugwKS9kMLlZC54MIRDmt1UtgMYHTcMkgsURWeJRxTBCr6jbygG
	JbZqg0+uQwktsOsQWWqdA+w+DapOPrJIc7vcWqE+8PoVUw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gyw4bek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 03:35:43 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2f3ec2e8d07so6414364eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 20:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779075343; x=1779680143; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NclULWFnp5Wyf9ypfaWjAmifa63DzbbBWf3uDDMhJ6A=;
        b=LyQ0KKJvmkaz4l975ZUnxrKkPbmg26cEZIZ7x2FtqD51nZIPWloDyAotIRN7ut9KJu
         hQzOtyshfZRTB5RH+R/Fq4hfpBia2W5amybc2g4/he1RyY0nymi0ky6sBF0ZxLZkvLNB
         ixgf5zUFhJD7s5/GhepgBIbs/dzJnetaMhi+4zdCEEIwaOaVc9ACAPK8BEBsw0hH4aMZ
         iv+d2kb75qv5sCLwAiotgBeBW2/u4o8wcnvZ4wPaeUgUidyn6ZGYzak8cBTsEE8Vn8J5
         95DAPBQP5REYdDi8mghH+uplJAU+Kxd4LlKWmemaxGqRI8bpQRBnU6ITb2OUFMNlAV+I
         FNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779075343; x=1779680143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NclULWFnp5Wyf9ypfaWjAmifa63DzbbBWf3uDDMhJ6A=;
        b=RIysGq8auOtBDqD6k+xiWLLqYc8CmRgA0STtinWXtuPE8gDY2ut1qWmzUeygVT+rO0
         2aC9Ja8+WBlybDm0kkORq2bQHnwsV28WMbWAknKtZZ9GvwFe8hR6dPZs/8gPsRy1qpGC
         aotIpPGZc0YwNO/lehduiDO0WO1nkRuBZIH1tsIJ0Kcydd8FzXDnPBxBgs7L1vqgy19f
         pHuhS7P5y9qlS6xMXxjDAehKqBtgCAr9Z17t+WELmt8EWRXlyh7mi/TwHqp1bmvcp7KS
         kW66XFZTpl0Pl0ubf2W9Lga3N0fFHXVMB+NkYmNFZvoZUySmPAPZTMvJcQKImy21udw4
         4p4Q==
X-Forwarded-Encrypted: i=1; AFNElJ+AGk10IRg9OGfGToCBWoZSZ029WXC4FOfPGd0y8eNSUMOBqlwSg42bpmcxi/7HD673M+rC57xvIZeTM90d@vger.kernel.org
X-Gm-Message-State: AOJu0YwE9jL/CUvmxRS5PDBYXZEl7QbWfO2uL7C1yQrGSUXCZabZqJBq
	Hq6g5J47jZadXh4q/9pVgKID01D1ltffThspmjVGJM1HAqoL4w8h7Ftw11reg4cVhrtuQaeQymu
	YAbm+m4m2aJ+y4YuGEjWcS5Op1twjrQuZX9XOQ22NFWIHMXNq1r1kr3QRDNESnjNLP1RE
X-Gm-Gg: Acq92OGe/n/tl4+IXTjEevmxKgpj6Rqa+r7941JUw1j04WNjorMZ1RcLiGFthDKvHtk
	BMqA7wKvii3nU1pCYb63DU/U6Hh25YCz+PUIZE+5ne/z53vdeUavR5cD5erzIKAzmPyKaoelXxY
	lE9ZIK73jHZKRNlc33pMZmfgVpBU7pSFPMIx5Ex+29KT1J1OWUf50gdyLYJ/qgCFOqoxzrYbvvM
	/9JLubmnCqQJWDHSOKGGWMX2TY352J5PxWakVlGxQai1oL0DWQ94+jKLGXo0PWPpBU6rdeq2c1x
	n0tVl6PSrX9S1Mbgla0t4KhjTbmfQPDNyvx6ohVz/BmWoAYqBmmYJqlSCf8d1IucJyIIRoLM33X
	HsoFDjA43fNhAMvLeaxBlR/3HhTiTibSUDv1DvQ9qYu0RrL8lWIwkVftO0fqIWsvfHUSq
X-Received: by 2002:a05:7300:8184:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-3039813d598mr5804144eec.7.1779075342630;
        Sun, 17 May 2026 20:35:42 -0700 (PDT)
X-Received: by 2002:a05:7300:8184:b0:2ca:8099:ffc0 with SMTP id 5a478bee46e88-3039813d598mr5804123eec.7.1779075342049;
        Sun, 17 May 2026 20:35:42 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294500726sm12214853eec.10.2026.05.17.20.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 20:35:41 -0700 (PDT)
Date: Sun, 17 May 2026 20:35:38 -0700
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
Message-ID: <agqJCmQRmFwhFClV@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <e495cf7c-a76c-4ecc-aa95-36fb0ee54b80@kernel.org>
 <aglY9of/4714us2o@hu-qianyu-lv.qualcomm.com>
 <e72e2f53-caba-4c53-b494-3c284eec54b4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e72e2f53-caba-4c53-b494-3c284eec54b4@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAzMCBTYWx0ZWRfXzMBFc+2ePF/m
 4lqo/Ie/h4dyKpwWU/8/byqlmuVmiA3XWCxRL53EHhu85UZRh8E25BzZN64z4uVqESOf2RWHLjn
 kAt36ecp3Phssifu6VPv/e2J24SIwW5ky07DZQqjQNf6tMzGKav/BEiMl9pg/3aVPTuxhfmtdUW
 j9sNzt5fZ0P2bTHjImPHhnpv0T8aDnZ+fj0Y70PobQzXPz1vYDra/HLN0TC+uQ34oGaS7d+3hpL
 ajFOMFm7A3rmLvoRpaDfk+GR29ifBt2yIp0AgPNjiWrAycaRh6Cc4illwCFmCRiqhaiON4psyoH
 dhHQR1e/35GPYoOvNWVj+Z0wM+44oZN80i7XQQoYS3kMGsLSJjTBO4oQItSLTYjkR4X2lJtPMuu
 fm9aXDcvR0XnC29sRr8+0p41pT+AXaBsfnXYmHJTXBTVbdqIte/AxxT0BXp9gTakXcpBX32SZ4L
 V0GuRRJB8RYltKA2unw==
X-Proofpoint-GUID: jA3gVKF3mFUHjK1foY5Q98s43Uz48m9i
X-Proofpoint-ORIG-GUID: jA3gVKF3mFUHjK1foY5Q98s43Uz48m9i
X-Authority-Analysis: v=2.4 cv=E5v9Y6dl c=1 sm=1 tr=0 ts=6a0a890f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=12i62POrZIV3eSzbxEkA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180030
X-Rspamd-Queue-Id: 6A7C95657B5
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
	TAGGED_FROM(0.00)[bounces-108084-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
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

On Sun, May 17, 2026 at 10:28:48AM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2026 07:58, Qiang Yu wrote:
> > On Thu, May 14, 2026 at 12:35:19PM +0200, Krzysztof Kozlowski wrote:
> >> On 14/05/2026 12:22, Krzysztof Kozlowski wrote:
> >>> On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >>>> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >>>> required by clkref clocks.
> >>>>
> >>>> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >>>> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >>>> differ. Document them here for qcom,glymur-tcsr.
> >>>>
> >>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >>>> ---
> >>>>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>>>  1 file changed, 57 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>> index 1ccdf4b0f5dd..57921cb63230 100644
> >>>> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >>>> @@ -51,6 +51,63 @@ properties:
> >>>>    '#reset-cells':
> >>>>      const: 1
> >>>>  
> >>>> +  vdda-refgen-0p9-supply: true
> >>>> +  vdda-refgen-1p2-supply: true
> >>>> +  vdda-qrefrx0-0p9-supply: true
> >>>> +  vdda-qrefrx1-0p9-supply: true
> >>>> +  vdda-qrefrx2-0p9-supply: true
> >>>> +  vdda-qrefrx4-0p9-supply: true
> >>>> +  vdda-qrefrx5-0p9-supply: true
> >>>> +  vdda-qreftx0-0p9-supply: true
> >>>> +  vdda-qreftx0-1p2-supply: true
> >>>> +  vdda-qreftx1-0p9-supply: true
> >>>> +  vdda-qrefrpt0-0p9-supply: true
> >>>> +  vdda-qrefrpt1-0p9-supply: true
> >>>> +  vdda-qrefrpt2-0p9-supply: true
> >>>> +  vdda-qrefrpt3-0p9-supply: true
> >>>> +  vdda-qrefrpt4-0p9-supply: true
> >>>
> >>> Either I do not understand your previous explanation:
> >>> CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> >>>
> >>> or this is still wrong. There is no TCSR here, so this proves nothing.
> >>> If TCSR is TX0, then you do not have five of them...
> >>>
> >>> My previous comment stay - you are not describing the actual hardware
> >>> here.
> >>
> >> And it should not be my task BUT YOURS to verify this in hardware
> >> programming guide or manual, but nevertheless I did verify and the
> >> manual DOES NOT mention these supplies. For Glymur, it mentions 8 reset
> >> ports and 5 clock ports.
> >>
> >> No supplies at all.
> >>
> >> Then I went to QREF and it does mention few supplies but completely
> >> different, like mx, cx, px 0.88 and px1.2, so none of this matches QREF
> >> either.
> >>
> > 
> > Honestly, I couldn't find QREF LDO-related information in HPG either.
> > However, you can find it on IPCAT. For example, in the glymur power grid,
> > these LDOs are clearly documented under the LDOs required by each PHY,
> 
> How is that relevant here? This is not PHY here. You are adding supplies
> to TCSR. Do you understand what a supply is?
>

I'm telling you the fact that I see from power grid table.

- Qiang Yu

> 
> Best regards,
> Krzysztof

