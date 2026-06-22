Return-Path: <linux-arm-msm+bounces-113961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kif8HbYFOWoylgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:51:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1656AE6EA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:51:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=W2bfUqfi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Syg8QKNi;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113961-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113961-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 641C03006B12
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 09:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 059AD2E7165;
	Mon, 22 Jun 2026 09:51:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B687E359A68
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:51:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782121884; cv=none; b=GlMPEXYwKJVbgK2s/N87NuhhdS9urgwFAQClBKODCYmgJcGFcc1IXhCdFi44sgxxrqPVtniCO5sHQn/d7vkkA8LkO5wcVehVMGP9g35G0yus0Faj6cL19+CNJzrJ/Gr/7CLezp2sPJXXxApmQ0E0QZPXWJm/fRttcXcySvPDFr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782121884; c=relaxed/simple;
	bh=aE4FsBnNJvaWhU93PJqxU50S8JsmJ5NhDPXl/TgYFPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lRe7fqkkDSRY9zfhN/pZ7CcGq7kre5CANgdkk4V366pi3GUrOWAcYfzt/S5TpHs4yDMNW5jFlfPsns9RzuMqms7nM8edbgDAAImD+NoJ27GA9760PzpCBoLraf1MzGAzJKdDsUJ4O2Waeeycdcm9hvnKYwOt47m2etSf8ExIEjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2bfUqfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Syg8QKNi; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59WLT3880864
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fRd6CaAcKy06xjZY74/JRE6n
	wNpgYi3kG87QOpxLYP8=; b=W2bfUqfiw39gTEX46O9qiXkaDmMqplS5w5+W5eWT
	WtOpbTsqMChqWZukoQZKv1UnWkk3+Pyr1hFfWufP+Mz5/FQiBqQTFph54NS/Jwz1
	vQkzoBHFXumHA5lQ1RzxAoudrTInt6RW2L4hXbpyPyq+gQhz2TdcBlNmW0+FLrOo
	vvDeiert0JoY3lkxAJ8eoNEN65FOfDLBF865zLGKxUWduf/Hgyuu0vJ5uvfTvPu/
	eicqzLu4oeiJNyTrva5iYLkXOy1/5ChJFMUS5yOMKgAaXmMb22XNwIVCutT3FIsO
	+E5XPktuHrN0Xci4lf7JlXxFHKipilLr6LCwESjH6x3qqQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewgjee4vx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 09:51:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c1f6c5559so4514940eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782121882; x=1782726682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fRd6CaAcKy06xjZY74/JRE6nwNpgYi3kG87QOpxLYP8=;
        b=Syg8QKNiWIsBz++n7Gjafw3RuOPqjx+5hbNLcXwMEmk+Uf3Z+3G71Nt4qzkWpqufAV
         xA76+B4oFkK2/fwF/QCyL0XZUgqsbS8DRSkh9md8/vuWzQF3oBq3a+DqRe4P/KPAmTim
         M1yOzPGV+oZLi/3bh3anOMNSwtU7833s3aViy5cc7Rtk5PnpJJIFWQbblxGvLs3hTS/H
         +BtJk6LAUe5uU84IZeOK4/LyFcNZUS5bSXxpLLOdVpFzyU4rdzVkSnPd+w790LFYYmrn
         7j8kQCnhkKY92UtzgAxarVupEt6GDb04EfbfdPCdfBXlF0wC/jXZQIoVdKQgFgjO0oYm
         uqyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782121882; x=1782726682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRd6CaAcKy06xjZY74/JRE6nwNpgYi3kG87QOpxLYP8=;
        b=ChArksuDWmdamzHsxOKmOzKS55VM85iQbxMsWmTewoVcbl1RHLlnp2w3OaqssF2RtZ
         WWQ5oIeiQQlc/Mlj5UW9J68Ve3hHC8RgtK+BRluqFQ+CFcmpUocr4Otd8CSHe+oG6brT
         geputf9eWG0cBSKVwCIuPTGHTxWuHE7M9FFfspzHUuRXVNWazcqETOkYZKY3ifk5C8X2
         kGIsfwQp9OVjd/Ij07m3frd79frfxAQGLCpCGRqmzv+R6YB1z75e7/YNVO6448+0nv71
         fQo4XABI+owgWUkPm3d7JLcLnRkH3/SNa23uQcA63FlJtJtjzL+xgZc6zZ5beISQ1QFG
         fHeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/7dgYrZ1IVMBOi6uROUchXKpSAz/OrWnd2x466kzWXe00OFlXOQKfsfBgBCo5dszIvI0od4pCWORJmUiJ5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9syocvoOrL2B7JJ50ZeFUhwMiT/lJ5ISLMKVOaAy4nNTvGlXv
	qfeiB+RnQ8Pd2yg5DX3O+yKRKk0e5kG42VkfBQiJ8c8eX0qqOFW7Hd1Cu1wHUPMHslcmWWmf4JW
	9TE0cHFVqgaJYMnOju87E2+z/RqjyxbpttQk5CTlLB6eLQzZQStQEDe8F7Mba/G0VOJOG
X-Gm-Gg: AfdE7claVbSWkyisYQxIkmvEp4+xReD/P16xUVVmEWEvv5Ny4Rz9kwlJ6Xs9ZI3x9OT
	2aNCyejRy4ldEd93tIPz+SnJfNdRw+L83FVK5RXQC4hiafoxjSUB1++XQ52O3ck74+NN4R27bl+
	Y4d92k9uwnd/UyVB5FSePnY61OTncl5PH6WX8kwFIeVAsf9fysbm2pXh4P5mQdGZdPASNwCRzLW
	Hx0Itk45fMW3oXno0WWLJHBvdpIrVTfhyW+8njDzvFes7McQP5PkxFz+YrLplNLPet3O5neZdlI
	kxLFi0guM/29OPadTgOtshWS/FqTwCUMf2LFeikmFrk9Pog3K0NQ/VI1VKumyY1YeJVPuJhFSsg
	xQ5koAQyekg90bL504m3zodZVnAn9RxTAO1XDMqAky0U4NZ87jMqy1ZHFBg==
X-Received: by 2002:a05:7022:ec2:b0:132:fac:2fb2 with SMTP id a92af1059eb24-139a202ec66mr8670844c88.8.1782121882239;
        Mon, 22 Jun 2026 02:51:22 -0700 (PDT)
X-Received: by 2002:a05:7022:ec2:b0:132:fac:2fb2 with SMTP id a92af1059eb24-139a202ec66mr8670810c88.8.1782121881525;
        Mon, 22 Jun 2026 02:51:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139adcce488sm6774074c88.8.2026.06.22.02.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 02:51:20 -0700 (PDT)
Date: Mon, 22 Jun 2026 02:51:18 -0700
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
Subject: Re: [PATCH v6 2/8] dt-bindings: clock: qcom,glymur-tcsr: Add mahua
 support
Message-ID: <ajkFljva7c/FuaSk@hu-qianyu-lv.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
 <20260621-tcsr_qref_0622-v6-2-c939c22ded0c@oss.qualcomm.com>
 <20260622-legendary-graceful-goat-3b5d56@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622-legendary-graceful-goat-3b5d56@quoll>
X-Proofpoint-ORIG-GUID: NDjg4g-EsIAs0sXFA2et9BvfSJi5DqFA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5NiBTYWx0ZWRfX++eqEiW3zHOa
 KMXoA2MUZCZ8H4n7Fp2g4UCZd16BnNCWl0hUr+RsuQeG+tkXk+RY94wkCN4ho9JHkpPi9ApMoKr
 lrJ7BDqzh17bCHcQB1JwShWbZSMbz7M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5NiBTYWx0ZWRfX6oq8UGqwPR7b
 6AVTJL79DsLE5M4L3sXX1FItJUJXQEP94dHMo5AYtzHh4J9P5bSHPvIef44zBwUbd+Q2MBVK/8c
 fOoQBpbN4y4gKdBw8uMPbozN0Afhfx0MiLsVuaNVpeGfv5IIDkoyfJuiW22DOriq0QBwDEMi8Wh
 ZgTUvqbTGh4byuW/hMXPQYyfNbGPu+ke7K7+nQn5FG6rHTeextREXbMONhYSwtOtdIm9QbGvL34
 rFvuLYfNYT5BhA4CZ7e2pRQZr7fW2+FFhD39tZYgdlhAGpzXASFsoaK+E0mG3Y5LrmA01OaR2uK
 CA7TmTZyJ8hJWGHe9w5OYOFzre1Iv3POLJtPVqgHjZFgebWr/QzVNxOzRx1oUo24IKcphD58+KV
 4R/aGddNM6teA6FjCWD11PQJVCw50OnJGm4dOg8WkU1sN1rGRVf/qqHZaAmRz7ifH0WEiryWvzk
 /7rC35TiAXFFoGxFRRQ==
X-Proofpoint-GUID: NDjg4g-EsIAs0sXFA2et9BvfSJi5DqFA
X-Authority-Analysis: v=2.4 cv=TO51jVla c=1 sm=1 tr=0 ts=6a39059a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=j0q-cQmEjkG7pVFzz6UA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113961-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD1656AE6EA

On Mon, Jun 22, 2026 at 09:32:34AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Jun 21, 2026 at 10:11:25PM -0700, Qiang Yu wrote:
> > Mahua shares the same QREF TX/RPT/RX component naming as Glymur, but
> > has a different topology: a single QREF block fed by REFGEN3 only,
> > rather than the two independent blocks fed by REFGEN3 and REFGEN4 on
> > Glymur.
> > 
> > Add qcom,mahua-tcsr compatible and document its required supply
> > properties.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,glymur-tcsr.yaml           | 68 ++++++++++++++++------
> >  1 file changed, 50 insertions(+), 18 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > index 16fc6ab87f9b..2b6422627165 100644
> > --- a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
> > @@ -20,7 +20,9 @@ description: |
> >  properties:
> >    compatible:
> >      items:
> > -      - const: qcom,glymur-tcsr
> > +      - enum:
> > +          - qcom,glymur-tcsr
> 
> You could have made this enum in the first patch, so you would avoid
> changing the same line twice. Usually adding line in patch #1 and then
> removing it in patch #2 is indication of something to improve.
>
Okay, will use  
	- enum:
	- qcom,glymur-tcsr
in the first patch in next version.

- Qiang Yu
> > +          - qcom,mahua-tcsr
> >        - const: syscon
> >  
> >    clocks:
> > @@ -41,9 +43,11 @@ properties:
> >    vdda-qrefrpt2-0p9-supply: true
> >    vdda-qrefrpt3-0p9-supply: true
> >    vdda-qrefrpt4-0p9-supply: true
> > +  vdda-qrefrpt5-0p9-supply: true
> >    vdda-qrefrx0-0p9-supply: true
> >    vdda-qrefrx1-0p9-supply: true
> >    vdda-qrefrx2-0p9-supply: true
> > +  vdda-qrefrx3-0p9-supply: true
> >    vdda-qrefrx4-0p9-supply: true
> >    vdda-qrefrx5-0p9-supply: true
> >    vdda-qreftx0-0p9-supply: true
> > @@ -54,26 +58,54 @@ properties:
> >    vdda-refgen4-0p9-supply: true
> >    vdda-refgen4-1p2-supply: true
> >  
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: qcom,glymur-tcsr
> > +    then:
> > +      required:
> > +        - vdda-qrefrpt0-0p9-supply
> > +        - vdda-qrefrpt1-0p9-supply
> > +        - vdda-qrefrpt2-0p9-supply
> > +        - vdda-qrefrpt3-0p9-supply
> > +        - vdda-qrefrpt4-0p9-supply
> > +        - vdda-qrefrx0-0p9-supply
> > +        - vdda-qrefrx1-0p9-supply
> > +        - vdda-qrefrx2-0p9-supply
> > +        - vdda-qrefrx4-0p9-supply
> > +        - vdda-qrefrx5-0p9-supply
> > +        - vdda-qreftx0-0p9-supply
> > +        - vdda-qreftx0-1p2-supply
> > +        - vdda-qreftx1-0p9-supply
> > +        - vdda-refgen3-0p9-supply
> > +        - vdda-refgen3-1p2-supply
> > +        - vdda-refgen4-0p9-supply
> > +        - vdda-refgen4-1p2-supply
> 
> It is fine, although this you could as well keep like that in first
> patch and mention in commit msg, that binding will grow, thus you
> already define if:then: block to accommodate future changes.
>
Okay, I will add the if:then: block in first patch and add some
description in commit msg. Then I also don't need to remove 'Mark the
relevant supplies as required per compatible using allOf/if/then
conditionals' in commit msg of first patch.

- Qiang Yu

