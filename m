Return-Path: <linux-arm-msm+bounces-96944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGBjFDpEsWlCtAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96944-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:30:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 03423262324
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 11:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32B65306D1DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 10:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB9F3CEBA1;
	Wed, 11 Mar 2026 10:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g/SmGQ56";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKVRLYgv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5AA3CEBA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773224831; cv=none; b=vAoH2Jxt9gGoPEQvOEb88u75kZdev2cc7LlYr7RAyHiI0CYsegTSCM0Sk5KFsxIwNqk9QiRNC2Umi9a2ip78dIqrCgSTImL31LO/3pp0X7Fhvds9v05k2JsvH7dQzz9REIJL6NvHDibQQ7Io0LYu9wN7JxCth/34K1gv0uhsuzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773224831; c=relaxed/simple;
	bh=MEWJHGeeC6PpNHKqe4NMQXI8Kni0IbPXM+j6vE6Kjuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBCSoArdfV6LJEYdcIhc8AvAeEx2DU88W9/qpT7Szo05ej0FG0tbTnFD1KfnXiB70FYT2Jz/m2DS8p41e0ghw56c+RofyJRoux5XIOSGaXAShI8CKo8AEe4j0Xuoo5eXfDWSXDxbJFCEVihcznRedf3R9oAPjYEAl5FmVacMq+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g/SmGQ56; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKVRLYgv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62B830xX1266072
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=99wJ4r5T/iMLg2Wt3IqUifMJ
	Jodj7jWILseLGYBjBVM=; b=g/SmGQ56c+eO5r6PcNWOsybrEGwXl2KMFtkZml48
	tyz3HK1eSyqmUl60my2jYN6WUZSyb+XdKr3hE53qgy2O+qE4PAjPMMflJidLderD
	zTBvAXs2w5hteSyazwAe31RLzSHPmfJBFIaAi9heLfjEVum/dZqtrg+qtFSFLLNV
	udCeBqYwouCx1gDKYP3YUwsjcXsxELB5gGsPCPqEg0RFGl8ih96569DSoicZJwrm
	Tg8wwrZfSDHq83Gg1HwWogWh/fVEB5BTj2zFrlflQ5EnllairdBES9R0A+E6xHvl
	gTQyc3Rg8F1aBZI5ZjFC9GQ2F0CaZ4qMWFXLWaCQUWXp5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctpkfkj0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 10:27:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso5756299285a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 03:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773224827; x=1773829627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=99wJ4r5T/iMLg2Wt3IqUifMJJodj7jWILseLGYBjBVM=;
        b=dKVRLYgverLLzWDIMTogbOQgSdJjlSbKJ8thx5PJNqfNRXlujSLf91U5tmGfdzOIgM
         TQEYPxdgZZ2TRZlkVs0qNWd5BFPe0BcLvToRP9Bkka8NASooWWokzW0PR1wwy57Ma4pB
         9xDrrOJJF4jPVQ8TJQr+vbjEyqQMPxV5hNBVL5pRIfSdTxnD522/SyXK2llIyoPfjwDC
         c0d+cDbklENXJm0wNy6K444wp82gCa1Ho0K0iVE3HXbqEO1E2196l2XGw6+afYfnH2Vv
         xOd6RHEMMi8/wuvk1+JxIU85n+aIaeZo8IIJ9doPLJpTXb9MHVX8z2ZeSVf8UgzEAeZY
         kKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224827; x=1773829627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99wJ4r5T/iMLg2Wt3IqUifMJJodj7jWILseLGYBjBVM=;
        b=sFA3ghNBQ0IkiNSzmtHb3FYTIBghA0i1kf+FWjIblAlCt6DL4E8JTIfAe5xtMlx33a
         bnyndQg4SObpDYrS+T0h5tYWcy1u+zs5sTWbQ1yqv783Q36tkWqjpCfK0cUmg33GMMZc
         RLHoWY9yrKqVQenRXiJwzwHCguQNbrBbcY57Z+bQ59epbUbl0p/gcN4TcaWo9oiP8ltB
         7RcXSal+beNnI4h+DuDInhaILHHJC4sxFS/S7rOYHf1sziCJmo2QL8+OivE96YiGP7Q4
         MwNJBDLOR8Sh6ECs8tH7kTbv0bIVxSTFkr8OhBbhRAZ2YTRp+wm0IW8QgYmkWXqcQOnP
         qbvw==
X-Forwarded-Encrypted: i=1; AJvYcCUS00z3tg7AZCrMH/M3wtmRxnzSk1Dl9xL7NS750wLAtgrWqvaEHNPG+cJ0IvIHBP6Ot8bUWDa2cVZcjiXv@vger.kernel.org
X-Gm-Message-State: AOJu0YyweCtbmdkfU9l4A5PeY1sLo90Z01TYF2eAJ1con97NXcJPGWP6
	l3kjOkumegKhCSzQlby69nX+97hxOr1svKKP+izkhnpSnNoc7lXtH+AitDYAVJqe9R+IIk0IaCo
	h7db4ETkNtjrMbEbxcsrfMykgN9fo6H/kKaq71bHAeJ9KE53RCVtVgqREiEMGW5b/g+gz
X-Gm-Gg: ATEYQzwYTMTVUF4lwjR4lHNnqmgXIhEorhq7/n717fsjGqGJ0Hg3wTFa6vApGuVe/IM
	qVTpsdEPR1M4QEz+j38xCALZKrsxUhCBocg1ywa2tU0kwvYO4v5o4BokNjPCLnTWJSpt6MGbdfT
	8MPAKqrAMJHjBe8Xu1AbGnX/1b5wjYLBrO5is4enzlUR2Rl7gCzY+G+BEMNFrDyon0hE2bvwSb5
	UHSsvmUfN1iyOzrXzAAI3qih3zkWrRtCPgb8qxWIWlfqj2bmFzt+yub0OnE5H3542xMguSdL8tc
	Or3p+3UGAqIgPBOL3zJk1vJdJXvYNsR1t70QT4Kal8wzRasxwAr3KcJ4K40hzcyQQm+4Gd91W9J
	n5eLDMByPaCOwTQ7G2rbBO/J5T9dFBt102s0C
X-Received: by 2002:a05:620a:1720:b0:8cd:8e8c:2087 with SMTP id af79cd13be357-8cda19b9991mr241104385a.7.1773224827301;
        Wed, 11 Mar 2026 03:27:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1720:b0:8cd:8e8c:2087 with SMTP id af79cd13be357-8cda19b9991mr241101285a.7.1773224826727;
        Wed, 11 Mar 2026 03:27:06 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f818d5eesm6660916f8f.1.2026.03.11.03.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 03:27:05 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:27:03 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scsi: ufs: qcom: dt-bindings: Document the Eliza UFS
 controller
Message-ID: <3udticxb5sodqsjnolzpwwaajsmp5ugvhpxn6pl6jjyjyc5ygo@izze4ccdhyc4>
References: <20260310-eliza-bindings-ufs-v2-1-1fe14fc9009c@oss.qualcomm.com>
 <20260311-radical-bold-catfish-d7ccca@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-radical-bold-catfish-d7ccca@quoll>
X-Proofpoint-GUID: 9B6mRYFsiibadnzvq_q3hu3ufEYyhutT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDA4NyBTYWx0ZWRfX8O4ZHo6kRf4f
 UTnEE4sDukFzvqNGKbUDf2HHscJI6WQLgw2x57cqz0FlrIJ2C7DXJkM+XfNIacTbeZ1ZPmWIWQH
 WcEPmDIA2hGM5KPDRzU7FTT7enjHlpltzKALUw+ut+6t111so88QKdn6KzmN2RVc/LD4HB7OKbQ
 bHKzQqdgAZe4qRbs8S/ZtXe4cQSBB45eg3eFe07x54YlUoOQMyxbdJ2xAef4ySfCS9Ba+GXwRyp
 RzCUrbcy3xOLLjVg9hCooeOEOtWcF0Q2GLcGTwEZ9GAxP2LQFs9VBspLjNFwhOlQbhmmIkgFS1J
 fd0Z86nt2cfvXdmUcPcVDJk8RlJ5AGA35QjFiors3RGpslSFCfLadZnkirF1Fb2tilOLl4JIzQj
 XqZjV2imgHrcws+Rp9DX1wGy8mXTbxPOTH9vVRJ0KZCJLA5Si+Jp4tucWqx/1ITodX+ETeiokdU
 ikf5CqXBwMqurYy5mTA==
X-Proofpoint-ORIG-GUID: 9B6mRYFsiibadnzvq_q3hu3ufEYyhutT
X-Authority-Analysis: v=2.4 cv=Gq5PO01C c=1 sm=1 tr=0 ts=69b1437d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Zn_5qlUWoac-AIgVFFMA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110087
X-Rspamd-Queue-Id: 03423262324
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96944-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 26-03-11 09:33:03, Krzysztof Kozlowski wrote:
> On Tue, Mar 10, 2026 at 12:44:42PM +0200, Abel Vesa wrote:
> > Document the UFS Controller on the Eliza Platform.
> > 
> > The IP block version here is 6.0.0, exactly the same as on SM8650.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - Rebased on next-20260309.
> > - Mentioned the IP revision, as Manivannan requested.
> > - Link to v1: https://patch.msgid.link/20260223-eliza-bindings-ufs-v1-1-c4059596337f@oss.qualcomm.com
> > ---
> >  Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> > index cea84ab2204f..80550144f932 100644
> > --- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> > +++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> > @@ -15,6 +15,7 @@ select:
> >      compatible:
> >        contains:
> >          enum:
> > +          - qcom,eliza-ufshc
> >            - qcom,kaanapali-ufshc
> >            - qcom,sm8650-ufshc
> >            - qcom,sm8750-ufshc
> > @@ -25,6 +26,7 @@ properties:
> >    compatible:
> >      items:
> >        - enum:
> > +          - qcom,eliza-ufshc
> >            - qcom,kaanapali-ufshc
> >            - qcom,sm8650-ufshc
> >            - qcom,sm8750-ufshc
> 
> You need constraints for minItems: 2 for reg and reg-names. MCQ is
> required. The mistake was doone for Kaanapali, but that patch was
> applied without review, so it is not a correct example to base on.

OK, so something like the following then ?

@@ -68,6 +68,18 @@ required:

 allOf:
   - $ref: qcom,ufs-common.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-ufshc
+    then:
+      properties:
+        reg:
+          minItems: 2
+        reg-names:
+          minItems: 2


