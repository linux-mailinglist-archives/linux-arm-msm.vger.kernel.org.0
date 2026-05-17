Return-Path: <linux-arm-msm+bounces-108021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB9VGQBZCWp7WAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 07:58:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D439455F5FB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 07:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFCC4300F14A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 05:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A533176EF;
	Sun, 17 May 2026 05:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFC/N99w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HYVGY73z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FEA319851
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 05:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997501; cv=none; b=kNn7ZGuyDRPCNfZvbvodC1rnK3n35LIZr1BcfiD97p1NhiBVXd3au+s8Vp5S/RM+zTH94RgFoiwLXubD1AnaZ5Zfag3/TO1+JfYbq8exVC9ZTdDhe5OFaAPzMnSigeNRhMzgkaxvyi/XR5rdacnZIw3ADP8eMEvyrxFQXknoVpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997501; c=relaxed/simple;
	bh=4597JBeg6kgfnQszJiOzy6dfc1VeQ61JX8ZL0rIsTg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WuC248dt5koAUpTJ6623cVvkLk/qXzfx1U8P/yRgtbUwswQYFVivMfBK93NNmojX2i6nIndpv2x2OUYRaupJjgJ+kKmM20VBurix4srmiEM+wP/nJ3xhtkY+msJJnzOVBt/4ZdiZTo4kECleGgrLxSQxrEPJr3eNlPGFCZ1tMac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFC/N99w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HYVGY73z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64GKxPbK1564165
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 05:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+9BwwnwVojxWCM+krwWXzCEuSIF4Qq5tfJRzINQD7s=; b=VFC/N99wKIDpnzIY
	P/PQPxaC91lm/Ch1XyBK1mIozNh4Soj50eYY5xmbtmkXfwMa8P6Emb6zmUNnFCPF
	rebg06IECnc7bexPuPmTKQjvgxrDvl0S8scrrB96WZfZchNMTpLMDDvZEEx38r1Q
	yVxBMurtqd7iBP3/L/oxL6ygjbMiAFpu15KE7e0CW5LmnC9RKH6qCrmb/sTT+QD7
	fKWHA1EKI2W453OL/RHQRVUNSBHVHS+gd3w2oqCjJrPnX4Nt8xaAnyJWSuH0tstm
	j1x7PNEvhKE+x+B18wE0C3QpaOmAGg2FJbZYGEFIFFIX87IPA9eKyIVKbuFXHhHP
	E7cINA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqtaax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 05:58:18 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c16233ee11so1663164eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 22:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778997498; x=1779602298; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+9BwwnwVojxWCM+krwWXzCEuSIF4Qq5tfJRzINQD7s=;
        b=HYVGY73zKFUeQyOPj2mdRpLjTNsy0teVWA0obYU4jegjlxih04uv5HASWEqD0fd85W
         i78A+287eIL1wqXyPVNP36ZNNy+tABxw2AF6UQCRyWhnc5UqkXL5+VfyPxo5gAKmRCor
         bT1O7mXQnO+SZBqIQWtOMkDjkLkXC0Cu4xy9fKmlixCyGogjYngvVfTxslUbxNVVbv1n
         L+8+zSBGwyA2sx8/9aLzQLtM6MPbSOhtQga1eCoBTFmpXNqCYjlMeRHsQQPPnBwjHnvW
         u9bDRkaRgR8RsF3jaBXZROPwqrWpHY/32jw7a0u0XTp7aEOM1eVesJH3tZnCBMAhU2d7
         RWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778997498; x=1779602298;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+9BwwnwVojxWCM+krwWXzCEuSIF4Qq5tfJRzINQD7s=;
        b=BN8MG6fq3oO0YxZN5NjsqMeasRnEZeD03R/NBwNWffYuMTgwAauNK5wTsoEZBS+Zk5
         gsHm8ZRtGTgtN9OE5f1G5en+w2diovS8WypUX9ggZWKJD0tVzZY/fp7xRLasWqHIhv5j
         yMpyC8WO6x0Gi3oHON4yzn68DcBQY1tA/cuf8uiJ3h/lB7sqE6FEQSznnOdtLlvN9awQ
         1YnQ2T/+GRyxJ8NP2/EB5uCeAts9/5m7HAeNNLE0EwnS97C3C1cDwSxXd+6GbdNtwVog
         6NUgvbQ440nLQNmGzd+GCUu7ZR9TVQzfGmrEIllyP2l9H7LVYubDITSFxb1TD9uLikUo
         PSyg==
X-Forwarded-Encrypted: i=1; AFNElJ9gaTbUS47FmvAASQ3AY91k/Bqbv4IOoeYYAjXzyjc6kHqqH+UibdKdfita6BLEt3Hi2bqu0PN09DqrTI7e@vger.kernel.org
X-Gm-Message-State: AOJu0YzWqjD+rprvW7HMVBdRQzBNoyryrNbEUCjySukEIIijC7hbZgIt
	N8+3WurZz0IimhkwLjh47Q3byQNw8qJeLtCrPH9rNwDUi65OfkWJcl3op2WW9bWF9Z5GHmpfBW7
	/oGSeT+vf9psKwnn/XMuBhvPhfVwFuPX6BDY2ixr9ewtSOs7ojRoz6CmFtSmSOjyDx15X
X-Gm-Gg: Acq92OE+bUiymaiFRdBxzW9S5K3jNb+qe8iEBnIxqpIJ0uT+ccGFy65VfttIZNMurRK
	UzkcoNy2UnEjbpKo0ajCdGgIuUGAdEwLwbcqhhf7bxoCZ7khpqORw2sssfdzu/a9WOIr9ngWU35
	bFG/eq86WxHURPnshwt7zVuaqk6ocsFe8mSPDDkIz/cgOXhta55wSznm66CNejhgGyHQyYFaOyf
	Wf2jww93pls/xhXPNrmokt3xe9QZwAYF+UxNkkb8ZpqFosW/ZMNJt11jKpgGI6GjbsVFHQsVvWR
	LiKiOoIAnS/NR7YdO4/5Uh4zELT5yELxGBeTGDlQ0QQCR9sK0zx3TSlOHAizoY7YIGuM/BAdwC5
	bh810AL8tbBkkRZwkdWrRqYECZaqtTOFPVM43+FiBSSA0yJg+iaWdWJcL4pV5YqtrAhKY
X-Received: by 2002:a05:7300:fd8a:b0:2c1:7afc:df06 with SMTP id 5a478bee46e88-3039816dcc2mr4998299eec.5.1778997497993;
        Sat, 16 May 2026 22:58:17 -0700 (PDT)
X-Received: by 2002:a05:7300:fd8a:b0:2c1:7afc:df06 with SMTP id 5a478bee46e88-3039816dcc2mr4998289eec.5.1778997497423;
        Sat, 16 May 2026 22:58:17 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm12422240eec.15.2026.05.16.22.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 22:58:16 -0700 (PDT)
Date: Sat, 16 May 2026 22:58:14 -0700
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
Message-ID: <aglY9of/4714us2o@hu-qianyu-lv.qualcomm.com>
References: <20260506-qref_vote_0506-v3-0-5ab71d2e6f16@oss.qualcomm.com>
 <20260506-qref_vote_0506-v3-1-5ab71d2e6f16@oss.qualcomm.com>
 <20260514-outgoing-literate-dove-2e2a73@quoll>
 <e495cf7c-a76c-4ecc-aa95-36fb0ee54b80@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e495cf7c-a76c-4ecc-aa95-36fb0ee54b80@kernel.org>
X-Proofpoint-GUID: bzrNdEmUDMhkgQPicbjxsQ0_i4ZQAgD5
X-Proofpoint-ORIG-GUID: bzrNdEmUDMhkgQPicbjxsQ0_i4ZQAgD5
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0958fa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iUXL32Dinvhp5_9vHWUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDA2MCBTYWx0ZWRfXw50kuf99q/t8
 sn9swtBFIc3W6gOa+8QLM2ZAztQTFv4JKG/iq0mR031v40kZ/c97hxp8vsMJ0sMVxFOVQ6vZB7/
 cd3LE0i3Bx3Q7Ihgcj4dnDAJH7OoCO83cf4NxzCPF6tUW4pkNK+QL4pu65+4QdQaXIcnuA25iQH
 MCq85FjQRF4ST5GvjbRLzy6VvmDl7IsfXFQP9/+E77M5Y17crrxp+fAS7tN7mh+eZT/IIRb6NXC
 4mfwJ1UN8qZFj75xIcviPIkQRxSQxXugLEaKBeyCp/xBhUb/i/EnI0Nh+KjHDHNXJnYgZnAp/Rm
 c4+7R4VcmWk/9icj004LB2HgdvzMSztitXdGwH4qdcOzuk9hKa2LVr0o6OGun60ZAFPZYi843ov
 mKhy+z4iXTE21P01xKWnXAhURNhzXWlOVvdB2cw1YaEQM6Y2BNRJcWhAGVh3zzaOZic06lveIUX
 dZjgg+CVdaCn0d3Bm6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170060
X-Rspamd-Queue-Id: D439455F5FB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108021-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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

On Thu, May 14, 2026 at 12:35:19PM +0200, Krzysztof Kozlowski wrote:
> On 14/05/2026 12:22, Krzysztof Kozlowski wrote:
> > On Wed, May 06, 2026 at 01:43:51AM -0700, Qiang Yu wrote:
> >> Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> >> required by clkref clocks.
> >>
> >> The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> >> QREF TX/RPT/RX components, while SoC-specific topology and instance count
> >> differ. Document them here for qcom,glymur-tcsr.
> >>
> >> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> >> ---
> >>  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 57 ++++++++++++++++++++++
> >>  1 file changed, 57 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >> index 1ccdf4b0f5dd..57921cb63230 100644
> >> --- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
> >> @@ -51,6 +51,63 @@ properties:
> >>    '#reset-cells':
> >>      const: 1
> >>  
> >> +  vdda-refgen-0p9-supply: true
> >> +  vdda-refgen-1p2-supply: true
> >> +  vdda-qrefrx0-0p9-supply: true
> >> +  vdda-qrefrx1-0p9-supply: true
> >> +  vdda-qrefrx2-0p9-supply: true
> >> +  vdda-qrefrx4-0p9-supply: true
> >> +  vdda-qrefrx5-0p9-supply: true
> >> +  vdda-qreftx0-0p9-supply: true
> >> +  vdda-qreftx0-1p2-supply: true
> >> +  vdda-qreftx1-0p9-supply: true
> >> +  vdda-qrefrpt0-0p9-supply: true
> >> +  vdda-qrefrpt1-0p9-supply: true
> >> +  vdda-qrefrpt2-0p9-supply: true
> >> +  vdda-qrefrpt3-0p9-supply: true
> >> +  vdda-qrefrpt4-0p9-supply: true
> > 
> > Either I do not understand your previous explanation:
> > CXO -> TX0 -> RPT0 -> RPT1 -> RPT2 -> RX2 -> PCIe4_PHY
> > 
> > or this is still wrong. There is no TCSR here, so this proves nothing.
> > If TCSR is TX0, then you do not have five of them...
> > 
> > My previous comment stay - you are not describing the actual hardware
> > here.
> 
> And it should not be my task BUT YOURS to verify this in hardware
> programming guide or manual, but nevertheless I did verify and the
> manual DOES NOT mention these supplies. For Glymur, it mentions 8 reset
> ports and 5 clock ports.
> 
> No supplies at all.
> 
> Then I went to QREF and it does mention few supplies but completely
> different, like mx, cx, px 0.88 and px1.2, so none of this matches QREF
> either.
>

Honestly, I couldn't find QREF LDO-related information in HPG either.
However, you can find it on IPCAT. For example, in the glymur power grid,
these LDOs are clearly documented under the LDOs required by each PHY,
even though they are not directly supplied to the PHY. In the QREF
diagram ,you can see the complete QREF network.

Of course, on some platforms — such as monaco — although the QREF LDOs are
also documented in the power grid, there is no indication of which
specific QREF LDO each PHY requires, and no QREF diagram is provided. In
such cases, we can only verify this information with the SVE team.

- Qiang Yu
> Best regards,
> Krzysztof

