Return-Path: <linux-arm-msm+bounces-89574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA8DD3A116
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 053FB3001BCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 08:14:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F2EB33B6E8;
	Mon, 19 Jan 2026 08:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmFGeRfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WXBMvHcn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5433B6F4
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810486; cv=none; b=H5BSmD2qxg32JqF19rFVXv8czWNkRLGTusMrwDssIOCjKz73egQVKSON9sCoaGrz6+HUiX4ZrKnjL8wIiOTPy/jYhW+WyrYxhXChqxKorpXofOgwyL719oT8sAK1s5ughe9y2mRFmyAdGIatbPQsGWkVUm4EHOasz3F/nH5+I+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810486; c=relaxed/simple;
	bh=+31ip3b70Ip6IMjL7WaTSjxwnIRHrFJ5Xc/ViD4PBaY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fKO0IuRpCgDdNDCmloYBwf1Ns3joiIXJhaxNyIsFnWM2KclldRmFx+B/0IV8fyCXbAvFmoYPLmlRsYeSjPkcIzxhCxqlxROhYjng5LsWMSY7es7/ZgTOizdzM4ii2CUqGs2z6cWpcb954QLZI+aMmFmL9IhufMJtLR6TDGutTR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmFGeRfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WXBMvHcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J84uuE037859
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=eb2+7GzkLTGyLPh1TpNzFy
	an03gl3K2xI1Zkdqm28O8=; b=JmFGeRfyPJp2vw1VuT0CGv5WUbo2HOaIDGqA1J
	coIDmtsxxfjsr4/4Z6i1KhQ9QIHgapPOsMyL2FiboxZP/c5iD+qPzn176qkb7h5T
	dwrIxHmLYXRZTXUfAs571DbEbqPoGsV/iGc7V0sLqs29VjjTQc9AfCLAwpFdGZTS
	N5WOV5cDOrsm5VD9+m+mTJZqzaSh3XuLxs3lr2Gg9N2PttEu5bg8Z5IcgCes0mSM
	K5TJ03EIU89W82EJ1sg+qhRnGLfteGDGLqPtnTXERFbW3GFuaV2qlumH+TPQ6ZOV
	NPn+uSpCaBz5350+yCBglQQA5pI27XrinO7T3qLnEnR2Kdag==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br1cqcf0n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 08:14:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8bc4493d315so1167399885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 00:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768810482; x=1769415282; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eb2+7GzkLTGyLPh1TpNzFyan03gl3K2xI1Zkdqm28O8=;
        b=WXBMvHcnfhTsGS8RVnoJFf7VefTXbq6XgsKxko2269Q+FYM8PMv++4WIXjOAI3S/M+
         loHmM9pPRv27d6aL0IqX5AkiBRZZipazT6z4/3yDW/i32X2PiDfSbwtu/xwtnygb7UAO
         sas8zNWHLFiLUQSgu+IqWm0zEKtgvbaq3IQ919ZW+X66C3rG5RCxQeXeirqwszh+1/zw
         eATfByDUBZKi6JuwZSSLS9LwGpbozjZZeOPiSWKIoK5v2Tucr2NBHV9LJhw78ZtaA7In
         lRxA8ajfOKLdSbyUi+cpn4tldLT948g1svX9IrwFp250OKCITeVml972pZ6P1zqbmIZK
         GlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810482; x=1769415282;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb2+7GzkLTGyLPh1TpNzFyan03gl3K2xI1Zkdqm28O8=;
        b=tafcALjQROTHMlZ/tIOZB+wL7vJTy5RcY/WiQfQGsYwsmelXq82pNhFfH9LwT2IkLV
         f4C/IEYqs9dMzLLJFMiBom7J+zT/FXeBU6eNJAmB4bzggxQOa/dfZMzSwQxUzeEBltt5
         EWihYd9wbVv/+GwsUtV8MuXQh+QfPvZs37oRpLV84D3R8zkE39Paac2vFHexxlLeP5k0
         vUvQ7oCPYRfY0zD4F7zbVQwgzRQKhcO8K9Qihhvpz+POI/xsBHXPJ4CyrmMtnC+W/KUr
         pYFKhPkb0nvgfe8qO/OpXZPSq1SgGM8ztkMOi2yRe92tPME4qevfAVfbqjg1Ge+1VfuV
         E9Tg==
X-Gm-Message-State: AOJu0YzGBPDv5FFNEvt5h0PDd9sX1KPXvA8s+kw8Ppmz5VepKmFbEZen
	64gbkDrlNSseBnWhVjQNnYoZLlcPQznw8pYcha1pHurveiPnwIKUD/n6USfE8nTYqn+inV3gumf
	bhi3jTtQRkAFy+0Sl6CQrYZnCI7TiMUkivZSgzUJ2e4716GorOV9N0dgoQehyYYadWzL6CUxrpf
	3x
X-Gm-Gg: AY/fxX7H0Ca8yyzi+L5FBUUDzjUjRLedlVwSDpU5zuCMWE7x4UaM/USHegZs3TPc2Wi
	LmYM7fv6APM4oGnbTuZwnvzwCS2CbmWPIjA+sDPU5tX3YREtc+/XmvzDmQUm8Xfv8cwsCCQ3n/T
	jfvTBljnKmGythC9rOc0ZvRL3FhkhEzfqkWkhPYOOm3+o3Y3houuP3gpAF4nOMIp/ga3YCpn9s1
	sitxY9nn5V4M9rRNs/6p/dnRhdtClYwfspI+fxKVuZK5qRowEG7Uhrx7nJMCPKQOifWba2km+Ux
	2XuZ04Kqmy69esNShstkp0wZwe69zhd2mhP+k/XyKo1UvUfwdsS+m+b3dDv9byd8HSkvbFRof7I
	r9aqzvrCJwjQ8RYrHWr/CAddCIa9mUKLR2O06Po2RG/G0NCmA7lGh1Q4hjvLjXVoXvvtWTpB7R9
	kiEuV8cT2Bf0kN/7o/ZUXeoNE=
X-Received: by 2002:a05:620a:3710:b0:8b2:e827:14bc with SMTP id af79cd13be357-8c6a693b1eemr1516950985a.56.1768810482104;
        Mon, 19 Jan 2026 00:14:42 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:8b2:e827:14bc with SMTP id af79cd13be357-8c6a693b1eemr1516948185a.56.1768810481614;
        Mon, 19 Jan 2026 00:14:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf34d572sm3063845e87.24.2026.01.19.00.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:14:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/4] drm/msm: UBWC-related fixes
Date: Mon, 19 Jan 2026 10:14:36 +0200
Message-Id: <20260119-msm-ubwc-fixes-v2-0-e0c8c630fdd3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOznbWkC/3WMwQ7CIBBEf6XZs9sABjCe/A/TQ4WtJZGirEVN0
 38Xe/cyyZvJmwWYciCGY7NAphI4pKmC2jXgxn66EgZfGZRQRkhpMXLE+fJyOIQ3Me61GIz1ByO
 8hirdM21Ddc5d5THwM+XP9l/kr/17VSQK9NoZTb3WytlTYm4fc39zKca2BnTrun4BFeZZ7bMAA
 AA=
X-Change-ID: 20260117-msm-ubwc-fixes-350f67d860d5
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1007;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+31ip3b70Ip6IMjL7WaTSjxwnIRHrFJ5Xc/ViD4PBaY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpbefuFARiRXSA7jRTI22VW/r0yJd4mYkIeWCjW
 0L7eq/Z0vOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaW3n7gAKCRCLPIo+Aiko
 1TYJCACVdEQSJx6nAf90StbKUmsO+ckIqADUgRKvUxsPI5r2A+yldvfJ/zGkBU4BfGM5Yk1r/bl
 /aTYT0P45DhwTUe+IOTFBm1SSo09gngly/kwt5z4WRj1hXBygzkqtDFOIqvIMH+NwTUo+Ll6bTR
 27yzxlXCQ7AONPchuC4d/yv0hdHUgu0MYMxpnv4nW9MuNHKe/cyarpBLRIx4Cgxt3h525S75Pee
 oBDyPywuOOA+hX/cTT9dmNvOTPYIB1NhYjK5AcmsivJrGIpzMlQEZ76f7EMojsPmDROC/7jjICu
 KO+F3fJ44FM9lH2Lrsy30Zs5hBQfaFDxGRDCGOeyyU48jG2V
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: cC1IlQGh8yjoC-ZWdQaJmMVSq8qD997J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA2NiBTYWx0ZWRfXzbf/yckkFIm4
 Oe4CL3Wu6/RIacwhhZdRAaarzQqdgTmmAGg9fyRWP8nN0KT2ZpJmWHZzgvi9wBBfVEmGIN36LF6
 e1lh4wLuXQ8kzS+620Sa2YuEKt8dLgRWkFhDuMkl9tc5zXAU2hZ0INCbRFNtAMPcg65xOkSmhSl
 ogtlO4a0ZzgIhXvi9aHlW33C7hD+AcMyEcwpQnk4+yic1i84rKZXsq3CjpmIeja54KMeWR9M/Yb
 mudXuuj+FC5pGIjtInXaNOag8rG9fi8N11ydFSycVl/E5IfTjZnjr9y0KaQjxWYUH1h1DRcSStb
 twLsJ0v4gQj16gBIqr4bXzFopzFZetvDd7Oe5PcEiBJvJrYJc2LOoTQKYjQsKgX0acMgMvxSEWu
 edlo27fEhUd9XpZmwjfiJdeYW6/bhRGFBBA027aPx9xJxzJXsgrEBCGn7YOgkgkrz2qoz249ZTu
 d06ud8ejv5TdH/PTV5A==
X-Proofpoint-ORIG-GUID: cC1IlQGh8yjoC-ZWdQaJmMVSq8qD997J
X-Authority-Analysis: v=2.4 cv=NfbrFmD4 c=1 sm=1 tr=0 ts=696de7f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4HV87y4NaVraivzdFb0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190066

Fix several bugs, possibly causing image corruption when using UBWC with
the drm/msm driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- Added warning if dpu_hw_sspp doesn't support UBWC version (Rob)
- Link to v1: https://lore.kernel.org/r/20260117-msm-ubwc-fixes-v1-0-d5c65ea552c7@oss.qualcomm.com

---
Dmitry Baryshkov (4):
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 58 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_mdss.c              |  2 +-
 2 files changed, 36 insertions(+), 24 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20260117-msm-ubwc-fixes-350f67d860d5

Best regards,
-- 
With best wishes
Dmitry


