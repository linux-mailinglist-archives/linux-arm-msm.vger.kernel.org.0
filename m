Return-Path: <linux-arm-msm+bounces-99870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGRcJffUw2lwuQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:28:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B957324DE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 13:28:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E920D31E7F3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 12:18:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E10A83D4122;
	Wed, 25 Mar 2026 12:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RR3IfW4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GCmvrND5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4A63D1CBE
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774441021; cv=none; b=O8ONT56H10XDGkmEbjWaKc8/ZLM5ZzIXWk/BFl84TRGj5x8uYmPIzz71NcGt/pa9pS2z8XYstISy8KQmRp3ckHi4rXgUdvmAsHzmNGd50OfXWuBP58+MMZw25kx+AfbMPLiAdFfh+433LIkYPti0nlwYDAs1sK52pbNY0gkKqc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774441021; c=relaxed/simple;
	bh=uTGT+HwoXv3r5ZEopikDz0sZtchwtzveYy4ceCEFL6k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bYzQjv8ZUbJuV22NQUNwWElBNT6Rml7PBW2f48cyDCmhU6dN5xnc/X/5eNSW7T+lshERNhCbI1fRVBVxdFNoLNcQW2QAXb8TlCx0rvkT2K5rRv/plag4Y+8HuLUcNlp1dTCwuKKt8fK4KUcryAKbEs7yDR/UriGms60F0rVWTaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RR3IfW4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GCmvrND5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGZLm876269
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OVzaIuHWFCgICrC8E9z9Qn
	bCHnVGjS2giAh9YNd8wbg=; b=RR3IfW4nt+CY5707Qq/eEB46BKn0eNvduv5NL+
	PkK7vpJ17Emm3B/Wc9dlVM4aaoPVUcjDj/K/evvYOx+K1JaFwJ9gBrcT7kxsY82j
	H/sf3j8zUvh0txMZtaezUCUtnB8ZfKWpWijxNfVGAgLGNuLYvgW7wOysY67FkGBz
	2n/Tt7YhF7Jd1UWaqMsJ9Ik2EZ5pxaK+hrH6UYs7+8+zPqUnIdLxG95aQ1U8seYl
	1/sAqgrzhfSiy/dUEh2AJbJvNLQ7Co+9tMcTS2jVIDLYUv1j4GNTBJTD2Uju8crt
	ILN32auwkdGLXLi97wb3IYQT9GdfJUWuPFkEmF5M/HaVKYhw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4k433-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 12:16:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94eb847f11cso11312667241.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 05:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774441018; x=1775045818; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OVzaIuHWFCgICrC8E9z9QnbCHnVGjS2giAh9YNd8wbg=;
        b=GCmvrND5UGIcwWOPP17R+oV1L4VdtZriT83X9Nf1ZSj73PwrLLgjgaVly/JHb3CJQB
         kbvT2FsCAhDms2M/40/b8A2h/8MQxaiDsLq0WDNfuRf4/99ILeT39nqV50N6EVrEDRGb
         SWDwHgwlB5OSvfbxWgkWM2C3m/l+AQHZsh98QWQJoaB6KJ+No5nL55Uh6sGzTLKTuHCr
         sCDTfqRIUyPA5QW9JZ/MWvbVZNiZqkQ8sLqU0HHqryH7CrhlhxT0YaUp9qjBlDFdX5GL
         VLlpyZMGxHhejQwTKmSPIXx17ZfBcmYm9AYK8LGWciidAxpwubm9ZwmutAQiy7s3/PT0
         heyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441018; x=1775045818;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVzaIuHWFCgICrC8E9z9QnbCHnVGjS2giAh9YNd8wbg=;
        b=cbB4oPLEi5XENG5dyBTJVWySzaELj+G/UwNfO7mhbFBNnj6h3sX3PAF2dwfuPbrvCd
         nD54ArQejZAXY86Eg69hRrX4IW0SW7RwUMeqBKYHuRS7+F8jr02DVgAe33xDUVVwtUpC
         Oeu+VTiN3jplZoWXNRVm84hTLWukMeqngYeN0NtlJ+yQWLRRCTU6NEfCVa96qF73OBvO
         d7ubAX0EUOVUa12n2/JJGtEMBE6mSsjm5tbfJXwEQpcmE0cQfuCxGrEZ/49BlBXkH+RS
         4MyJLEYKHJtMXDzZLUl59E5ewElgvuX53F7hW+KkccrGVmU3jOF8kej+vkX3KckWcKkB
         vIEA==
X-Gm-Message-State: AOJu0Yy+1yaM/LvSmhPb57P0dny5GZ4KOrchvKzzSEK/3Jt5zGL2Vrsk
	GFksmFbsOXoxRi8MbDRcqyXtTHOwxpgdCsZLZu0CRMJByPTr0B7MyUUaTn28zaPtjW4oS98kQ0E
	cxZMnGbEVEBYgcxryVS9dzou7FvkiFb8AaJmAB03uEL9G432rHNqhg20Fw1Ym17gtw39i
X-Gm-Gg: ATEYQzwuYKsecuSR9zNo16E82mSFZNKygg7WQMsbQOunpRC65Me0OWtTbUetlstbkK5
	6GH0g483EWzz0p8j6CFPtct0Vm5Do7r+pB6H38QBDGf2fUG0OWkmJx+HUAewPVELR0S2cGjGAZu
	TFntxmeTpMGiT2+zBZp1oXT3GN0NJDw0dBhfC+ed+G/nIyyzYWrLiBOX7VBwDo5cum0fpISQmfb
	VEOHkbqx9OZAQEcHUBmEHaFummGmmPrYDI40tWx2N3+VVxM/C3QoJ2I22UGuEKR506ZkrsB06uQ
	+wO+rW/co5+aUkNJSYhNVEMkhmuE0mSeNKHuSVzW2aN6rkoYRvcHx1mtaK7+DvXa2xolTYK60xm
	2hbJQdM41d8+I05E2Q6yX+26J6x50oKNRQBz1PB3nwYvj
X-Received: by 2002:a05:6102:5694:b0:602:7470:2428 with SMTP id ada2fe7eead31-603870bc884mr1638645137.10.1774441017992;
        Wed, 25 Mar 2026 05:16:57 -0700 (PDT)
X-Received: by 2002:a05:6102:5694:b0:602:7470:2428 with SMTP id ada2fe7eead31-603870bc884mr1638619137.10.1774441017566;
        Wed, 25 Mar 2026 05:16:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b8a106339sm6480356f8f.36.2026.03.25.05.16.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:16:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm/msm: Add Qualcomm Eliza SoC support
Date: Wed, 25 Mar 2026 13:16:41 +0100
Message-Id: <20260325-drm-display-eliza-v3-0-dc2b2f0c74a2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACrSw2kC/23NSw6CMBCA4auQri1pp4DoynsYF6UPmQQottqIh
 LtbSExcsJnkn2S+mUkwHk0g52wm3kQM6IYU4pAR1crhbijq1AQYVEwwoNr3VGMYOzlR0+FH0ko
 UVnMlFD8Jku5Gbyy+N/N6S91ieDo/bS8iX7c/TexokVNGa15w4LppoLEXF0L+eMlOub7P0yArG
 uEfKvYgSJCRrDyebAWirHegZVm+ujiX6gIBAAA=
X-Change-ID: 20260302-drm-display-eliza-634fd1c3c193
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
        Jonathan Marek <jonathan@marek.ca>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2133;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uTGT+HwoXv3r5ZEopikDz0sZtchwtzveYy4ceCEFL6k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpw9Ivgtj85TYGF809/neI0AN9sHw5BoGn4llqV
 hMIIJQ1UnaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCacPSLwAKCRDBN2bmhouD
 101bD/0QGddyyISd3zfx+N2t3rQhikfcuLeZvwIo2WHhFJCJHQLHENy8ivKO7I/oe4982lZ8A6C
 dJS1a4MO0e174ZCEAVaTACeQBRlXmeic3Qq43tid5xQEU59vzqe1g4l0Go0xzTROjGqM9u7tLdo
 rzSZN8Pi5P6EQPNcXcycef9Rg5FoBhmheuXU9bJVPAnHre6e2fPxGVPTLfWUEBS9/mGrq5LEM+T
 Q8EJmvoReokW+YjddIbbJ0Sq2hIsOtoNiEYVQmW0jNqPsrWDvU0bdmiSquMhpQmtyRCqZ0wKPz+
 SLgSoHdhY6aEuqv33gGbw0ndPWMmSaTUVZQDth+zXA2dWdMUhUXlhkMq4hnmej34C+PFZIP1rXB
 nmMsWoOL61LGKD2/TpkS47Bk1VH2kIYNHlTp27pcMiPXnq/16ewG0jT6aOvdt74tY+2YXW+kVm/
 EKy5rjT0w1Z8oy0SDWCFV3Be3XAORNJq1LwSGCMcRrQl+k44s6qIZHC4/PPlvfBgfD+XGwPI2lJ
 Xv9HT/nJplPEEtwSKIqNvndawRx2xGoOCM/sddyU60w7d2ArHHZOJP5F7tfWkxy02Wmdsbu5J5s
 7RXCqI6S5O/n4EjGlTmNkXqi1QN2JjWWcRrDHKO1c3mb26hmRqN2WeZML/ZJ/vCiDEKULgTrZPA
 F+mdC1Bo/lJbP+Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4NyBTYWx0ZWRfX3rP91WyvyVaS
 5zm8a7f7yDUZI+vT5LDNyOPsBmm5ykpHZgxfo7Bbr51FbL+iKjZLRXHxRRh6aT4EesRwHsvhHau
 NOuMTQvD8D7nhZbxToZJt8HODmjU8NqFUJ4F7f/e66UTnwh4PnsZ1q7oTpyfMBiN290DMuxutEA
 o7iligW6loXTFD/EpUHZbR62UCVUDH2r36XURfpa2thzqZqJuloEX2XOJgiHFkZNFrokcM246vZ
 xB1/sz9d3zrdbMGbD+4Pz9rif4/AzY5qMhIExaTByWJQeqXIRnF3focB1dsPRap9Qd+1PlyArw0
 EzAym7IPBekFfICRXXCl/fFlmHq42MksQQ/eLPvaE29BvEtqhBM05FwJm1vc3gNDnu8syODl3CU
 XmYup6mrWRFS8kABa2Y/gx6oyeD8UBbKvShdkqAX8VQIrn/k+KSI6AityaDWGODmmmHoXbMNi5j
 AD44K8fw932Gbmig1RQ==
X-Proofpoint-ORIG-GUID: 0NPLk1oXKpYEDAwRjPvAjxEfMY4I_cPD
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3d23a cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dxrMdQflyC4LrkcXn-kA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 0NPLk1oXKpYEDAwRjPvAjxEfMY4I_cPD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250087
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99870-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,msgid.link:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B957324DE9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes in v3:
- Re-order soc/ubwc patch to be last in the series. Maybe it should be
  sent separately?
  Use defines for .ubwc_swizzle value
- Tags
- Link to v2: https://patch.msgid.link/20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com

Changes in v2:
- Add Rb tags.
- Changes after review - changelog per individual patches
- Link to v1: https://patch.msgid.link/20260303-drm-display-eliza-v1-0-814121dbb2bf@oss.qualcomm.com

The MDSS on Eliza SoC is evolution of one in SM8750, with several blocks
removed and added HDMI.

This posting brings working and tested DSI panel, while DP on USB was
not yet tested and HDMI was not prepared.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (8):
      dt-bindings: display/msm: dp-controller: Add Eliza SoC
      dt-bindings: display/msm: dsi-phy-7nm: Add Eliza SoC
      dt-bindings: display/msm: dsi-controller-main: Add Eliza SoC
      dt-bindings: display/msm: qcom,sm8650-dpu: Add Eliza SoC
      dt-bindings: display/msm: qcom,eliza-mdss: Add Eliza SoC
      drm/msm/dpu: Add support for Eliza SoC
      drm/msm/mdss: Add support for Eliza SoC
      soc: qcom: ubwc: Add configuration Eliza SoC

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../bindings/display/msm/dsi-controller-main.yaml  |   4 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   4 +
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 494 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |   1 +
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_12_4_eliza.h | 365 +++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |  12 +
 11 files changed, 885 insertions(+)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20260302-drm-display-eliza-634fd1c3c193

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


