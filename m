Return-Path: <linux-arm-msm+bounces-101539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJmkKTxYzmnrmwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101539-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:51:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F37388956
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 13:51:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 305CA3085319
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 11:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 455233E0C4F;
	Thu,  2 Apr 2026 11:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFM4J8OS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K46kN1sG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4403DEAD0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 11:45:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775130347; cv=none; b=ozK5frzJrOrk5HZToL5zvp0mL2HED5LdVTz568fSw643Aq/IFnXzUtgQwX+xhaV12JsMbWLY9pqhsjIWN3yRKlcHt3+m/OxX1atriFIsXuy5BmLs39zUmyU2Zat28oSDLhSw0ydhtrHp+0xLy6jHb/TZA8TglNAWtKrxwnhQdSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775130347; c=relaxed/simple;
	bh=oolybNFYF2YC+JBXqETSseIPPbtOhOXk64H3MqKsvSY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PEYvSY3LPvhdk5+GBmz/lbsUyBchGsIaKkD3wmHlTihq0Gro77WGOwFai/88wXKB3YuBBjRyOiNS71VCL5QTwjqGpENXJEsUaRG1Sq5Vc3FhDsYf2Ll3PY5+QKh1UTPI85FWD8HznrmkbY78leR41bhUc9YuGlilqJvS8MjBgfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFM4J8OS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K46kN1sG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632ADCka1551206
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 11:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9QQr2yUYx0BXFI7syW/yH5UPEP1YMmo+Pqs0/TkwKi4=; b=ZFM4J8OSQ3e7uy9o
	eQkgGDHQ6aikJCyPH7lrkqLdYS1CzGpcpSyq4kdL43BMbMwOBSHJG0j0gnQpbCkL
	fxOBr2FQWh/KANoFqjtETOI1F1VnsXfXgTPG5G/3Fjm3syn1nnH85owd8L2oSnPy
	NGZpVKcBkCZZ+8iThY+cp8A3LXXHidXMJuoVx+HGKPkH+WtWYPkmmUzMS1hR48Rt
	w3mUf36HzbBsdT3PfVRBwZFjQtoORSiYx/d6DLZD6ChGBTsjvXVj52YhEnEvkBEV
	pymumDYgNsNOGIMxQDAVNa+ZAdIYxQrihyNjKuSVMkCqp11tWsutE+D82q6APw88
	f/jI5w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heess8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 11:45:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso26154271cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 04:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775130334; x=1775735134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9QQr2yUYx0BXFI7syW/yH5UPEP1YMmo+Pqs0/TkwKi4=;
        b=K46kN1sG4b4JMN7oes6d13+fs0dOg+GPRSOOoCR2m5CsL2j/XSl42qKoLuFQi3jgiv
         ESGAKdEEG0ZemLVoWxictzexaVtiZXFP7wO5yZtf6kpAdu6i1F5A0fu4Lb4tzXU0M5Iq
         khUUCUgL7emHKCgZN4igXXGRkrH9dHxpRtFZDT3dBweO33YCXUH0iCwmvkxSU9MS4LLI
         qzU4rJlSX8FRnnuposjed5/7Y9xs5laZhFaloi94jPq048G2Z88srczyRUojNNOmSkKS
         Pn5UQ2PDFLGX4fa8qh1IQGkC55kIAGgbTrg9203A0GFWReURt8BazFcDvcdOJOcMnc4X
         YjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775130334; x=1775735134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9QQr2yUYx0BXFI7syW/yH5UPEP1YMmo+Pqs0/TkwKi4=;
        b=bGKkMXLs0qZ9tqECNlhBr272Gl3M8+FbRqiOJG3giFAA/wbyrSD5cPmmetPZoYaB+l
         hPDFiwBHqGjMx3NmAlpyJ/Bk8Zup3FUIW7PT1uMOlaJNLhH3UwTiEWwGA7vvee7v0UYY
         0rz+5FsnBFX7JaZMlKQf8ASTfehvllquQfwuXKNmAhmNrvuArRMOAsVIuF65ROLlzcH6
         Ks3QdCoPxKUTVnBzxiQD9wBQTsmeo20aJ0fBTGx16f2zBQc/zCrundJ0qeKeYgyo3ht7
         Sz9UKhoYdAHGCoqTAMygV5nCQu+A9PHlYw/TQIjsoOwIyLoWHgSghD1wn68JML83CjBW
         47SA==
X-Gm-Message-State: AOJu0YwkTpWXWz89u2h8Ba0IoFTlkUbZYBhxMuo+ea05m6wjG3T4yRtn
	W7awahs+0/kcVrfuwt1pvbRlJM05+EyUFPVq4c8au3OzaaoQtYeVTaCISWFtBi1cVmctOtwCiXQ
	fM6Z6RC9zWq/3QLHqhWzDt343OrX8IsP54/JP7OLjCVXyXZsvCt3V4LME7YmsIsermkRi
X-Gm-Gg: ATEYQzxmatgVtihYNfLlxbjjc7kDpO5Nr4n31BSEZ3TTH5FaeMlkyEUcodasFGUfaN3
	6xhA87HEcyuQQRjhQzND4H4fEYNHYy7Stuyjj5wwPh8gq8QqRMFKLF0K0/h9c+46D60e2s8WTbx
	cLx6GWfPxBBbSiYRta/WAp87MKIhzH+9/8mU9z9rIEIb45W3vTMWAGYpO2uSAEtVXtHQsMWCCGb
	c2IEoJa7wRG7IRlNLcS/l6M2kAHDf7L2h+zxWa8Vly51lcGL3bsK6MD256VEmaQZR4pavB9DQcp
	cPCwcp5rShYEmmhqfEAd5LgmYf6YITJxlD7fGeD2LLgBFwZOafc6fW5D0m+4KQMZix6n2ru+TiO
	iJ4zOy5BysFX4lBLb7XBiYhHmSKm/+9mTl1ra5m/MkhXP
X-Received: by 2002:ac8:5d0e:0:b0:50b:3d9f:3846 with SMTP id d75a77b69052e-50d3bcf47e8mr96663231cf.50.1775130334203;
        Thu, 02 Apr 2026 04:45:34 -0700 (PDT)
X-Received: by 2002:ac8:5d0e:0:b0:50b:3d9f:3846 with SMTP id d75a77b69052e-50d3bcf47e8mr96662731cf.50.1775130333789;
        Thu, 02 Apr 2026 04:45:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4888a567bfasm141614635e9.0.2026.04.02.04.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 04:45:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 13:45:15 +0200
Subject: [PATCH 4/7] dt-bindings: display/msm: qcom,sm8750-mdss: Correct
 DPU and DP ranges in example
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dts-qcom-display-regs-v1-4-daa54ab448a3@oss.qualcomm.com>
References: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
In-Reply-To: <20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oolybNFYF2YC+JBXqETSseIPPbtOhOXk64H3MqKsvSY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpzlbOTL/W7oo6HfZihZ9nbBrijftS24ToZIGuw
 qi4TNrUU1iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCac5WzgAKCRDBN2bmhouD
 1w9BD/9wQTfAUcub0x9gCyELjdPbRWGEm2D6pknvFvy3j5g7GkW0MpxI6sTNINhwTUwec71uFeY
 ZUmGc2A52Lj1aCzyjDPlXEzeR6gbEp9t2qJOfmMALxKsMMByLf+z85SeIZEMyGqajnunh1Sl5rC
 ek0b7TLYq9u2rfguL6MwUw95BpsLPO1J8ZBH+Yq1Py6hVmN4Rh7mEot+8aVARyq+m2SBIVWvXLc
 WCxFtNPYBv9wSiV/I9TVP8srHxcE83zYssL4teMFCSj6y4gvb7qWUMnNopk8neUDUM1+89gHXK8
 AtBs2MdxuH+0xLwkzSaRhN0eH/ZGcB1dD1uf08P9lOv86oFHgGPbbcEHRVrYBa5TZsYwA6lCgnj
 X64uJHZItU9FsGRdpO3Qby4rCvaK4Ue+eAsWDKWk7nmLI8krXAULTnEIPxp5eo2W8Qf9cyWqJlW
 nM+WK5/yXKUJNOG0C0CqhjwmJ010NXgVd+Ql3UDWuGtcV4/kZ+yCyI3CrcAB5zms/KlQ5sPAMQA
 IXsw7zKMeur0O/0y50SJ6qkIFQ2ONRQsgDFQ3bO125wJTZSjtKkrGUcS6HSwHqLFt6edBCVHtJQ
 Y8iGbSX+4SLpHN4AWUCXgEfhL2LO8L4PV3qslO1/l5+u5KhDwGgGER/i0Y2DSbKfa8m2wahFGKk
 b0xk/3cV8W5bLFg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: 6mR7p3VrwUHn9skoQKFgRbK4of-z-y97
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce56df cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RlbI4P1zFy3kOpNnRyEA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: 6mR7p3VrwUHn9skoQKFgRbK4of-z-y97
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEwNSBTYWx0ZWRfXyhDnBA3vJuBQ
 19IpioIR7M6igN4TJHuOaT0KYOdzb1LwDbnbAnp4Diiqp98iqyvFBQwSSDhHG7De15tfxMqnrlE
 0pr7it7txhCZjh+jj5Sik/1ROWc0g6M3ibm8ve0CHcn/MEo8DTFu/2Cid1Y++r3HpTMuusOkV7/
 xBEHiQ6fHYoPutyXauAUrMb4P+s9jGB8o2BEhPiCnefqbmyoQ+Wh1fK1dUpavSgHTmlUFJIYxml
 dzDvn4Xs60oDmbcdrB+5e3LktjyRsNHkVnVb910IG5zNZLsCp/1TBYsiNEMuC+FffQNOcNNd4nh
 hF6ZlryebYdcc9pVyjrl+chET/DaUfRtKVUVQMhqzpEBT5eStB9ccCblZhDhsYUSOC0TngoKWZ3
 OEGPVO0VfPFPQ0KHNg2KQFaJqS+F5ROQ/mETu+PGtmg5U2F1U7b5LbqOAaUn2llRmNyZt/qTJwA
 5VHMhnHcIv85X5BRNNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020105
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101539-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ae01000:email,af54000:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 12F37388956
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

VBIF register range is 0x3000 long. DisplayPort block has few too short
ranges and misses four more address spaces.

No practical impact, except when existing code is being re-used in new
contributions.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sm8750-mdss.yaml           | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
index a38c2261ef1a..46dc0d28da29 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8750-mdss.yaml
@@ -117,7 +117,7 @@ examples:
             display-controller@ae01000 {
                 compatible = "qcom,sm8750-dpu";
                 reg = <0x0ae01000 0x93000>,
-                      <0x0aeb0000 0x2008>;
+                      <0x0aeb0000 0x3000>;
                 reg-names = "mdp",
                             "vbif";
 
@@ -389,11 +389,15 @@ examples:
 
             displayport-controller@af54000 {
                 compatible = "qcom,sm8750-dp", "qcom,sm8650-dp";
-                reg = <0xaf54000 0x104>,
-                      <0xaf54200 0xc0>,
-                      <0xaf55000 0x770>,
-                      <0xaf56000 0x9c>,
-                      <0xaf57000 0x9c>;
+                reg = <0x0af54000 0x200>,
+                      <0x0af54200 0x200>,
+                      <0x0af55000 0xc00>,
+                      <0x0af56000 0x400>,
+                      <0x0af57000 0x400>,
+                      <0x0af58000 0x400>,
+                      <0x0af59000 0x400>,
+                      <0x0af5a000 0x600>,
+                      <0x0af5b000 0x600>;
 
                 interrupts-extended = <&mdss 12>;
 

-- 
2.51.0


