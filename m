Return-Path: <linux-arm-msm+bounces-104212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFVrKWnB6WlbjgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:51:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 806FD44DBDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 08:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 051DD300EC69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 06:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E1843D16E9;
	Thu, 23 Apr 2026 06:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqwtUNsy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3qE2BW/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49153D093B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776927045; cv=none; b=EokYDPeq1qUdwKFJ62C9SYLkn4FYX5liGFZUCqDBW0ddki8bhBHV/vrhtdtm44CAqEspISA7MB0vNDCZf83JiLJUKNxqNHvbVdGI/3HEUPY9NlSmGDx/YgeCVWUwZJ1zy0Uk62Ia2wRJI6Q7FtMRGaLWTWAqn8NqONPujkDL+/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776927045; c=relaxed/simple;
	bh=0fe41+WI6axE/tmZl1DmSgsC5MAEfE36ueeyk3WOP1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/OwLXO9W7Q0ElkB5WiBn8kvYOoEtaZ/OGGjKz2pAjv0Zdv5JNIQ1nm/seU6adA3p6IP35K25Cy/7i/+2TYeNQMkawhmJZfo3VOpKZTHOHnQWjJKEAJb2KTpnKWYCqyYlxF1AMOkJ2D1Pw/tLYNeb7Tt6LuYVavqYRcpgwi+Ycw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqwtUNsy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3qE2BW/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N3A7rt2956038
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:50:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3E+BDv1BqtNk9uvpqnAxiRVc
	A/9n0o1mNCepDC7uVrI=; b=GqwtUNsyZeTN1pifBEb6dyC0JklgTlh/AXGtsZ3J
	oqaK1cZAeQoHonV5VhqIeoNPqOyX9gc1RAgyWE5wPy1JRFT/j4vjy57sVnrdlJ8n
	99koa3+00ddG2Py19i9G49X3e2RcrSSxzNpMET/dwerZTaAbpAlmpY90+mbRsL6a
	WwcWQpuIG7dd6sTQFtpsHUVwcEx0IfOX3nEh1uI4zxN5oEa16B3wEH84XzStnk6+
	yc6KAR3Enwv0gop9eVwDzNTS9/cgf1pDXK+u+8tNWR1ehDUuxURhSPJ8dLcuH5IZ
	n3BH1gMuUKNsOnqTXIq/K6ceXW/OQeo3N5GdtPUCVZ8jXQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16q2n7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:50:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba9a744f7dso8252423eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 23:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776927038; x=1777531838; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3E+BDv1BqtNk9uvpqnAxiRVcA/9n0o1mNCepDC7uVrI=;
        b=K3qE2BW/QAs7e/qfN2g9rwbx1anPa24OryjVhvGfbZEYcgIl1mJYfKMUQC5HKdpi/w
         vjFmCGHIJdHfjfX5jlK2QPuz4hSmPTd3Y5Ogt9CIfOboubxfTSJuitsknaWt1Z+Noab6
         xvN5QhBFJL/YGaZaviZctgu95P6lxlgZ8aN0gLf09rWcfvVPr8e90mT+cjXWEtw7P4e7
         zM3llSIx/Qy1WvrjEoWLNV99IIRKMIZNr383URBQz8U7Is+XI0VhNgRC8c584B+xfW2F
         796XNbUn46EuL9ug4D6XStrxTF2uy1u7nAgn0245UpUHGimaeQ8OFYvTmL9XIO8PjDGv
         fCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927038; x=1777531838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E+BDv1BqtNk9uvpqnAxiRVcA/9n0o1mNCepDC7uVrI=;
        b=U7uIipYYyBc4g7BiiTh5tbSuhOx4eu584z7zkdNV4jFECCiuZUSI5Z7g/KjWoWwbZ6
         uge4X1iTEWFURfsecxD81CwKs3aRqeYKCC7SpIcG2y9qx4FwqFwy3riQPj8ZDyrP/2mU
         xESomUTc5h9QyOhv/Xtix9FEir4eEalgJg4PRNIyPISuw7y5VhNh7fXnTkW6I3N7wKan
         oMYQgZrvqPebrHsYyc2IfCUmG7CglXttPhVi5yw/qCkY/ZG6LM7Ycv+DzScl0MGY1Iv+
         KPkgeYGFr41cqF+v4jKnAJrO4HMgtcoQDxIqYo8Dk8FlETvTGPQhMCBwmvnob3Gs0+Ej
         iFtg==
X-Forwarded-Encrypted: i=1; AFNElJ+ra/vhXGrUjLUv01dKVf/xKhL4NYsVCE0Yo7/kSZasi4Gxtp5hUrrBgb8ZU2eEwxh2iXmS+krRXbCVefXe@vger.kernel.org
X-Gm-Message-State: AOJu0YwxveDTMvxFE7MV+lMNoXUlubn9SV0BXofku2iF8EOW1s8eowXh
	ckcEWLfJ+Qi9FCFuegHgMWRqVigUIbZE1+Eox0FEhz/wKOyggz3yLJVJ5Jt6wGm6eJX2QX6PCoT
	iR0uqeqWOlfTnT6vm9f5i38V1le+8x9GI85HXZ2kisArHbDGdlloxaxTRzyHuHxRYQSSn
X-Gm-Gg: AeBDieurI55fm3VPpQr7M5WY93IlEOKCnLcyUDmoOEVXDxJcEKfIKrNBLy6B5kGEaPi
	mrw3sghC1ImUanCEScr+9n3CTB4NvEeLWN2AlQ2n8vpdkU5Fjwj3bcOSLTaLjV79AqPvSDXfua7
	3ms19brYe9gymOPGDOS+EleeoWMimlVT9tuPVoWNaKk+h7ROG0Bua97uJ2DKljCqRNGlZDqU1pH
	LkYWzSiek9VRz8Zg0KLxASQQ/uJEtVFfzivrfOXtYiqgRCUtLiTG/9GoLSSyp1Y1x1cZIeJQqLf
	w+xuqdput6I9OvUZTmrCShYCxJX7+30BgcghhZ2IUjp0UcVguMiEpvbmQAaoOZVFsASOxcc42UR
	Ysyj+GDMrYqkxTyuphgt76bNiLdDy6QpWbALi/mPylwfXdH1oB/aBmTYC2MohhrMM8mZjaeoFfI
	6EINM=
X-Received: by 2002:a05:7300:fb91:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2e464ea4fa6mr12166482eec.4.1776927037542;
        Wed, 22 Apr 2026 23:50:37 -0700 (PDT)
X-Received: by 2002:a05:7300:fb91:b0:2dd:2d70:8aba with SMTP id 5a478bee46e88-2e464ea4fa6mr12166471eec.4.1776927036986;
        Wed, 22 Apr 2026 23:50:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53a4a7ff1sm26260515eec.9.2026.04.22.23.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:50:36 -0700 (PDT)
Date: Wed, 22 Apr 2026 23:50:34 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add QREF regulator
 supplies for glymur
Message-ID: <aenBOtb57KmUY5e2@hu-qianyu-lv.qualcomm.com>
References: <20260420-vote_qref_in_tcsrcc-v2-0-589a23ae640a@oss.qualcomm.com>
 <20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com>
 <177667583832.1359985.10364830499161105694.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177667583832.1359985.10364830499161105694.robh@kernel.org>
X-Authority-Analysis: v=2.4 cv=KPNqylFo c=1 sm=1 tr=0 ts=69e9c13e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aLEXbJoCFh11svoGBvsA:9
 a=CjuIK1q_8ugA:10 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 3G-3jpIZz3pZctYo5bGIQ2-pnqANy0HC
X-Proofpoint-ORIG-GUID: 3G-3jpIZz3pZctYo5bGIQ2-pnqANy0HC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA2MyBTYWx0ZWRfX16+XTiMprkja
 oDXTMwFY+BPTMsSzbwzJCCuUF0uOGn3RPf9Akqjhez5IZlGW9sgfeB+TMeep9BIwx79vmnKjTfp
 aB8c0Y+86ejcEukUOFOhhToPRLs991WCmGTKq9nQzshrOV62seInMMeUTneA8DdZsNjdOkiJj0j
 YtbZOyT75FjDHjz1hBbhqt5jbBD96ymMWc2Kl6G7kgy4BSBQ8miXu437echnNgDL48vtNLC2L+X
 EW0ipdCsp6CVGne5n/v/s6O95y5HfFfJhTGl8eHKFPzNP5qivaulvykp9G72/A/S3IHw1xw4VVK
 DZuvj2WPWSZPagv9cM/dokVsrkgcM2dWgLpQsGDqHgV3pUTdkIaSTaxVDB+kfYMSuNqn6ARJcSt
 43eDjVrTq9ZmKhOFZIEdBh0bqEB7ovzmTmaSpltSuxu/HrhJixJ9wgqKtgHolEbn+BcqgOkahmy
 jAWFYmxUd5lTe2vLyUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230063
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104212-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 806FD44DBDA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Apr 20, 2026 at 04:03:58AM -0500, Rob Herring (Arm) wrote:
> 
> On Mon, 20 Apr 2026 00:42:52 -0700, Qiang Yu wrote:
> > Add regulator supply properties for the Glymur TCSR QREF/REFGEN blocks
> > required by clkref clocks.
> > 
> > The vdda-qreftx*, vdda-qrefrpt*, and vdda-qrefrx* supplies map to common
> > QREF TX/RPT/RX components, while SoC-specific topology and instance count
> > differ. Document them here for qcom,glymur-tcsr.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> >  .../bindings/clock/qcom,sm8550-tcsr.yaml           | 40 ++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
>

Will update it in next version. I checked the pcie phy yaml by mistake
when I prepare this patch. Sorry for that.

- Qaing Yu
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'if'
> 	hint: Keywords must be a subset of known json-schema keywords
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml: allOf:0: 'then' is a dependency of 'else'
> 	hint: Keywords must be a subset of known json-schema keywords
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260420-vote_qref_in_tcsrcc-v2-1-589a23ae640a@oss.qualcomm.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

