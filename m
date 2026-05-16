Return-Path: <linux-arm-msm+bounces-108007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN/OAouMCGp8uwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:26:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 729AA55C607
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 17:26:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1E1F301DDA8
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 15:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45613E3D90;
	Sat, 16 May 2026 15:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Usf4EMwG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q8SCMMcy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C05A3E4C7F
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945124; cv=none; b=avY4rWdkwuyG4ZiqWDN/28ggkSdoRARKRh3zSEr7Tw2G8a6G+iaQLuJ7rFHGsELFhXeBbsCDIBmfmrtdmTNnNWz6PTWow8tToPKJaNztl6eDMSm+fDwmB14B8PE1hmev5RzH5FeJAmnfqnhgmwJ5RRoGLONcXR9UqwyQ+Jebgww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945124; c=relaxed/simple;
	bh=K4P/jy7iPs6uOmmZQWIuzenlByOnePT0fEzz+cIf5E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PLx24nF40Rzkbx5J8SGPMindDLCCVx3pejPN1G4wsgKW9m5pM5MeR5uxwsCxISy/cekK3zL/JlvczP7boWqDHVMgDROCHc7S5PiE3F1v4HWl7G82i/05AZTZI9IiZTySI73bDQxYF+prydbIce6581eyUI9JuBYrOQGBE5qwsmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Usf4EMwG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q8SCMMcy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3o2QA4083987
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRYRE7MmsWLhtA5XL0Zaq4CcIUGaTOA18JqmZtzcf4k=; b=Usf4EMwG7057hmYI
	Ph/izuCPLTMwNIksn7gwAZvjdDO6U9ppAk8udBtX2D3bdWeqgOFZM+KMwW5UabN/
	n6UxX3D7ottD6Q0UD5y4nlVFtqr6Uz/HFO0cV0nJsiVUJ0oOB2QcgG3OMcNwEygO
	YlUKhGi+jmU0hi9MORN+z5woL61t2rHbwiOw5Wsvt4//8YaRtRl2dOtFEcnR0NFG
	sZURjIjXm944en4Nc+nbYEsHdeofJFWtFLejuf06BhXAdKcTiTXYRaPmbX+uPBKL
	8Mj8KBq34NKYNhq7kioiFWA5Ki0nHgErJh0CIq+8/cELphFhp991kXIjhhunku0i
	8mmYKw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0q94yd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 15:25:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d890580e1so22535671cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 08:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778945122; x=1779549922; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LRYRE7MmsWLhtA5XL0Zaq4CcIUGaTOA18JqmZtzcf4k=;
        b=Q8SCMMcypNVSNcxOkMH/xXP2duvP325x32mkWDIAsHodDnTOUuIhvSbK9gNpHbe8pa
         AQJJthKO0ob+ye9QB6fMjBGDOlbNtsMU46HHQ+p51Ngfz4R1KhNk3ykkv0VGQCmTkBEO
         297HXQISdg6wmTYgmzgKNZaz7xDc/d3vAs/gY3PNvWM0AjU79zMfegNAKu5xiqsGLOKZ
         QgbGkhcAsNn6luZB735TISZUj38O8b3HbL2lyhXe1s4Mh4v6j+jQKUsfawdYzULt+y/5
         rwaqI0aIv6TuXzlR3K3LyHF/W6QXrsltu966kZOC4VFVmLd2gtmDXlYpnjyyTWT5iPSr
         35VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778945122; x=1779549922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LRYRE7MmsWLhtA5XL0Zaq4CcIUGaTOA18JqmZtzcf4k=;
        b=QZxL+j/h4LMkSEBbWNpoaZP/XwXHGSXQ8lOh28F9qseh0VwX8hzd55jLdr3grSMu7Q
         2d+nSBmzXeNk0gWTIfqWAeVw3lxw7S8tRFPsFt1THxY0xxlbtopCuxWSxGbKeDNuwzEH
         72xGAWWV1AIUFARhWx0PwkYrKbeYgo6fMLecG4cp3Txj6KZvEK+0KytBsur8gF+CBD31
         3uS+Gxjuf520sSWux4n34Hp5uJOe+lCvUkClUHXH74ugW3f+4La9w27ToK5cMpLilU1+
         mhZ/VH/POCxMnl65FIna2CJ3INJtWkQJKNBf+U3Nj2jUdKVXHrC5XSHML2fwvHcBokPo
         J7ng==
X-Gm-Message-State: AOJu0YwRztpq+1E82KAsYg0IHylyH62Y6fRcvor6I9UqV7FY6DOMrkHm
	XPujKl8YBoRaX6tukOWZZ0m7J2L6iPJMZqO0Y1XfZ9VoENPN9yhMqvbaAj6FTIkCsX9cMpbbjHI
	tmKCFEARPUSi4JtWlakUCD8F7B6M3h/lpbPxmC+hIb87Zj/r079fbCEHMyK0frV6YsdHc
X-Gm-Gg: Acq92OFaQLVHaZAnmZg1P48s9jaeMUqT/umgjdNqwwrGu77wP3QEoSyfTMSRS1MzwmO
	iOmpkAjCS06F6sjvTuVQhCKMTMR07Cz58/rONoT5Z2dEa6Esc9wHCCZfpjl3dikNRkO4Twk9hry
	SpwsMvP9r9z+TEuA8hu+EJU3cWUa6IDPKqoWQMGDyOUJqdvvnmtFzFCvRsGdXVk/ZXucvE+FuE0
	wW6LLf+SF3njFbXhGLOjnJ1UfHYECpp7yX7yqUZ/NFVLK+ixdyW/IxGelsmp72eNEhzzQR5Flty
	uOLd34Q9Q57AKYY7rNRegV829YQE1pbDRKBZFMmJu+RKOOCwwsL6dJ7Wy9fcbmDiSlMEvoUGpt8
	hgFDlCLkkBf26DwlVyvLeybICEZkEBQPKvyw9EURX1KzJW3ssZKQWMDUoS/e8/IjZjiuBCU1a4p
	/vcvnmb/Dudgs5/8YBFXwCx9r+OKCzaoVd/Bs=
X-Received: by 2002:ac8:5c92:0:b0:50f:783d:8cb1 with SMTP id d75a77b69052e-5165a29619bmr129086831cf.58.1778945121738;
        Sat, 16 May 2026 08:25:21 -0700 (PDT)
X-Received: by 2002:ac8:5c92:0:b0:50f:783d:8cb1 with SMTP id d75a77b69052e-5165a29619bmr129086171cf.58.1778945121210;
        Sat, 16 May 2026 08:25:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164cd939sm2057972e87.70.2026.05.16.08.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 08:25:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 0/8] qcom: display / dts: Few corrections of address spaces.
Date: Sat, 16 May 2026 18:25:15 +0300
Message-ID: <177894506983.2448625.13587872132931108802.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Zjoxh3fFGB1jqFf5tBw0JUwIMvwzQhnO
X-Proofpoint-GUID: Zjoxh3fFGB1jqFf5tBw0JUwIMvwzQhnO
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a088c62 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=n4T_STkPxQ6NuhZPjVgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1MiBTYWx0ZWRfX6mZlN78Jeyow
 IihY3V7x3LLS7nRGf5Wa5Q38Z35aIvkeledPLfw8WwFCtv0bXYWkb5VQDiicdGfrmlPqs1cPhKJ
 qCCGXUMzktZB7qc80rYM+I/gEnkvWxvjMqeaPHq5rUIGI0OvHkBxSt6IdzsuNIs0XzxdhC+2vuq
 qBxlaqu0PEnpqJpJMztta73v59D4IvFPRHPZl9edW/COa7j6TavA/4Npy+FS+HODTc8Zhr6av/g
 Fdnd9oDD2+mJiVpicdEUZz9vbSH85J7fo1DnY3+AxfOjQrANB6PdGn4sWqsth5jNZfFqZ01DIIh
 AY68SuC8ZD1c+l4zL+Kq61Vs9kUP8J36aJsX1rFsksiUEG+OzhFlz8uYQUbLGe82M86+XSKPoxX
 ORIW+WpoJR9eNhLakqirk9lVB2yNbqosP/nDwxecmbZnl1Ku6j4uB5jiDQ+xWv6vUR5T7B0khbV
 9IdBA0y/elgF77KD+Pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160152
X-Rspamd-Queue-Id: 729AA55C607
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108007-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:dkim,gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sun, 05 Apr 2026 16:33:56 +0200, Krzysztof Kozlowski wrote:
> Changes in v2:
> - Patch #2: Add dai-common.yaml reference (Dmitry)
> - Correct subject
> - Rb tags
> - Re-order Eliza bindings patch
> - Link to v1: https://patch.msgid.link/20260402-dts-qcom-display-regs-v1-0-daa54ab448a3@oss.qualcomm.com
> 
> [...]

Applied to msm-fixes, thanks!

[1/8] dt-bindings: display/msm: dp-controller: Correct SM8650 IO range
      https://gitlab.freedesktop.org/lumag/msm/-/commit/cb6f19552b49
[2/8] dt-bindings: display/msm: dp-controller: Allow DAI on SM8650 and others
      https://gitlab.freedesktop.org/lumag/msm/-/commit/557226acef41
[3/8] dt-bindings: display/msm: sm8650: Correct VBIF range in example
      https://gitlab.freedesktop.org/lumag/msm/-/commit/bef8a15a6ee2
[4/8] dt-bindings: display/msm: sm8750-mdss: Correct DPU and DP ranges in example
      https://gitlab.freedesktop.org/lumag/msm/-/commit/399f7748789c
[5/8] dt-bindings: display/msm: qcom,eliza-mdss: Correct DPU and DP ranges in example
      https://gitlab.freedesktop.org/lumag/msm/-/commit/795b19cbcf43

Best regards,
-- 
With best wishes
Dmitry



