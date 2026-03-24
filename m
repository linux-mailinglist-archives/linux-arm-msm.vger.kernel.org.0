Return-Path: <linux-arm-msm+bounces-99526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BRNMHP7wWlSYgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99526-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:48:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FED23014EC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:48:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 199323035D24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93FD1389111;
	Tue, 24 Mar 2026 02:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inMpW2fW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I3IX4E/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1466388E4D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320495; cv=none; b=G+JbjfyZG9RSCyn5BKgRbMUcxoz0M6pKMCCaudDSocKAtFr04E59/JaNtLU0y2fixdRbudP6ON9iO0MQ6PdJXTt6F90ARePxoKhkBmIksLeG9clFwwtZ523DUplTgl9aadbo7UyBft5CapNcbXtMDXN6zK5nRGKYnQBTi3CMSuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320495; c=relaxed/simple;
	bh=Tmd+gxRh0zMc7goWZkYjDkOhd7+39w5YPSm0QADkkW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M3cyb1xHxepQXJ2ZiHeJqOrMlZ8DAd9JECT0IyHatOfH+cbSvOj5JpQRkgwpGgrrESgOeW2WeZC0s0tkZ7iL/4gNQnR9kUGMQ7Yy/2a1Bl3wxm7xMcrPOdQOIwRX5mfDApJRJYrZ8xbZVI2RQqJBTwb+NFmTw8aL6Iv14FplxGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inMpW2fW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I3IX4E/u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqZQ12971865
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U3vJrTCvtA5VbYGj6R/QkEk6
	GFV0eo4cVRNuQ+yDIqQ=; b=inMpW2fWU/qSTmX2KSH6MMXIdDKqKmJ8nvKaG13x
	ntEXhARKCDcftvRPRDUUIaZPWUUlkgzn5w0PQpUGEoevgE341E1Wod6xvWzjkmvR
	iI1PUikH5RdP+gqyOZzjzmnFjlfhazQqAl+Z9f5E4/6gmTWBUOaeE30sdFGiui/G
	K3sdDjnq+jvg8kkgnSGNm7phiCXOaZ9ZtDPet1DTErOyQ1FIxAYGnOXgMnD4NPUU
	kYaag5Yk98NkOsuqwJBHkecciGzS2/ScU9wHeB62v949X3Fm80HTINHVVOeTGltM
	GDaE92RqmNG2QscAnzUVdwQ8aiMqYfuZNt2tqB1KFHrObw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc3qtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:48:12 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0f6593ef5so3303855eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774320492; x=1774925292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3vJrTCvtA5VbYGj6R/QkEk6GFV0eo4cVRNuQ+yDIqQ=;
        b=I3IX4E/uffIBr+0oo0271hTLYP1a9CZuNRvnG0auRsuNV+s2xQ2R0lZGGActEbfsfl
         8KoFyAirgVUlmSETDCqY7PqgRL3thAN+cLoobQzeRXh79AwVHo6tolO6HNu5KstC5dZg
         /I5bPJ7eIkt34vrwhGWj0TTHzqYrmInZAcKbl54J9XIgW0qka4mvz+eDLcgiIcZ17p7A
         66Z4NRIshSXrV6UkH5QTM2MfzVbFfhwbsH2jtBXnb0MxFkXBZLHoBylMDRNio3rjwHAh
         0JE7EntGfEUhgzth1Bnvxz3hU8r0dpio7s4UMf4EK/qepMb0xrpkzJZuK20cYhl1c0d5
         m65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774320492; x=1774925292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3vJrTCvtA5VbYGj6R/QkEk6GFV0eo4cVRNuQ+yDIqQ=;
        b=Eyh3+Mob+AlD3HHIB2B41Ghmzn9EPctNHIT+Ttkuc1l8CAbKEIz+7+BKjdC54Je6jU
         WGjUFGr8tPLVYLDIrDqqmNrzRMK9F72h6GR5MKrE0GRdvbaIg/Po6Rk4SYXOgY1aFsNH
         fzPHiThgZeFrhpENVNgfGmIgCI5ROKXbuoE/VFg7+wi222DknGAi8F42P4zaAvFmbSDE
         /kGXryvExHOZTK5XVbC3dOcamDLenTTLFunHNlp68KO0z585HQyEYqHhMTYq5a8N32KS
         L3FJK0dXloAO8V/uMNXaij8yesMa3ia1BtdKJInkGuGGocMZPdHMmFHwksgXfgUSZh+l
         beAg==
X-Forwarded-Encrypted: i=1; AJvYcCWFQNZkzkaoCYYPVRlocr+LAxvmeNbdHbf5YqE3DatwRXLPB42FhxaoyBiD4tiyH0/Z5ZZ7AZSp6O2ujq61@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyay8igz0UgKxMwG2kU3e09PZo6Swy+jan9WX087zgqCm2VzlK
	03WQ0NBBkMQ89SZmWh/3mppa5cuduCt34bSbaTEjOULQeUV0BfjNUZiepZvC0leo47DlnCVjaDR
	o4KfgByHqIhjPBWiLJMm9YvxVwsm03cmj+1PvmZ6bOQzU75TEzACBA7njA/O/Yl9o4+F0
X-Gm-Gg: ATEYQzwDZ7rQsYxbUj0q9h2VeQPVCnOXXL63o0Y+TDnGEBMuWsLYYfxbCcEKMtUZW+z
	JebXJmbvKD11OgTlGhNPuModg6K49ByCf+ZPOjLsDuJc2TpyV/og9QERi7bjuFIaTe5DgJT0AC2
	snRE9Qb9eIC6w6qWFtyiNeZN03embKCxFKqk+5oycVLTlUpPVmD4tiuw4o2N/zu19lM2dbAtsRA
	l/mtYfAXM3jg0jAeR/9fcv4lEp7tvwDKdDViL1SgrsIhb0+9fiq/AgPAkkxquUO0duaLq9soBXw
	fQstOQdbAFjzGLneeMzB22NB3aCHy0fv6D9eUB6X98hoh8f8uskCoNHGt7Q7d1NAuiZWO1flOTr
	+jjkhrfBqbZQGWu05PQkmzWcfqjhc/7SaMK3AdWJImxWEFSsCpXIRr4yRmoBGK3ZfRMnFd4rxzh
	w=
X-Received: by 2002:a05:7300:fb89:b0:2be:10a6:647e with SMTP id 5a478bee46e88-2c1096d56e4mr6573512eec.19.1774320492021;
        Mon, 23 Mar 2026 19:48:12 -0700 (PDT)
X-Received: by 2002:a05:7300:fb89:b0:2be:10a6:647e with SMTP id 5a478bee46e88-2c1096d56e4mr6573494eec.19.1774320491396;
        Mon, 23 Mar 2026 19:48:11 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b3253d0sm14093923eec.29.2026.03.23.19.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:48:10 -0700 (PDT)
Date: Mon, 23 Mar 2026 19:48:08 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Message-ID: <acH7aEBvSbiNwhBz@hu-mdtipton-lv.qualcomm.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
 <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1fb6c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=fekkFCTB2vo3PLuB2O8A:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: w1tQr33o-iMrLIutOEC3-FlmXvYkjYDl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAyMCBTYWx0ZWRfX29HRbRcyKaNc
 zr3k2br85Et+KEUTYs7aC3lrQ8y/7EfP6ypkbVnpQ2ExdmeEp9L5HbAkKtBUtAEzzC5SuKsLmPP
 feUIq4b+xAKTNghxgSDNGLzkR6W4BJ/vTGxSrB3DbaIU9E6cWMBxBQaPC3r0dmV1AGwwV3kG+oJ
 v3yC+MlmyJGWgAWGoYIo6L1Ffi2cmUXg7K24ihqoZX6+kqFFHsc7hvKCGbAZjzIsVnqrbyYWfc7
 jOC3rCQzjN4A7DecAwh3W0snIJfUz0Ds+3R9sOk+jjcocxsMqiW9qSwKp+mPtC1ylDjqxC4u+jo
 3xlz6zraNK8/0QKfGKsq+8JBVz2O2dSkGJXi/9QBs1ysImfYL282rXtcfna4VkhtTtHDu2VDEho
 e8Mg/qovWfK2W5ZVCEZDpDxFVzoxt73C2NkWSgQhdbY7b+ous1CvAc+CXZ4P/u06hTMiG3EkWx2
 bLE5zhmybwlYQDvbNGQ==
X-Proofpoint-ORIG-GUID: w1tQr33o-iMrLIutOEC3-FlmXvYkjYDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603240020
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99526-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,hu-mdtipton-lv.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FED23014EC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jan 19, 2026 at 11:28:07AM +0100, Konrad Dybcio wrote:
> 
> 
> On 1/19/26 11:20 AM, Konrad Dybcio wrote:
> > On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
> >> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
> >>> Document an interconnect path for camcc that's required to enable
> >>> the CAMSS_TOP_GDSC power domain.
> >>
> >> I find it confusing. Enabling GDSC power domains is done via power
> >> domains, not via interconnects. Do not represent power domains as
> >> interconnects, it's something completely different.
> > 
> > The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
> > 
> > For the power domain to successfully turn on, the MNoC needs to be
> > turned on (empirical evidence). The way to do it is to request a
> > nonzero vote on this interconnect path
> > 
> > (presumably because the GDSC or its invisible providers require
> > something connected over that bus to carry out their enable sequences).

The GDSC itself shouldn't depend on MMNOC in order to turn on properly.
It should turn on just fine without it. There *is* a dependency between
CAM_TOP_GDSC and MMNOC, but it's in the opposite direction.

For MMNOC to turn off properly when all BW votes are removed, the
CAM_TOP_GDSC must already be off. If CAM_TOP_GDSC is still on when MMNOC
starts turning off, then MMNOC will get stuck in its collapse sequence.
MMNOC waits for all HW clients to de-assert their active signals before
it'll allow itself to collapse. Most HW blocks assert this active signal
more dynamically than camera does rather than tying it to GDSC state.
The GDSC asserting active signals to RPMh that prevent NOC collapse is
unique to this particular camera GDSC.

If MMNOC BW is removed when CAM_TOP_GDSC is still enabled, then it
should reproduce as an icc_set_bw() failure on MMNOC rather than a GDSC
enable failure. The icc_set_bw(0) request would succeed because RPMh
immediately ACKs down requests, but the collapse sequence would get
stuck in the background. Later, when someone calls icc_set_bw() again
with a non-zero BW to enable MMNOC, then that request would fail because
MMNOC is still stuck in the prior collapse sequence.

Note I haven't explicitly confirmed the Milos behavior, but this has
been the HW dependency for at least several generations of chips now.
I've never seen this GDSC get stuck turning on because MMNOC if off, nor
would I be able to explain offhand why that would happen. But MMNOC
certainly does depend on this GDSC for the reasons stated above.

So, regardless of the originally stated rationale, CAM_TOP_GDSC voting
on MMNOC *is* a logical requirement to guarantee that MMNOC doesn't turn
off when the GDSC is still on. Otherwise, that requirement would be left
entirely up to consumers to understand and enforce.

