Return-Path: <linux-arm-msm+bounces-88369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F36D0DBFB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 20:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 039C63079E8B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jan 2026 19:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9635C2D3ECF;
	Sat, 10 Jan 2026 19:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXjkNgiv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CL35ecxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D431C6FEC
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768073893; cv=none; b=DogUZEj/3VdhSD7OIiSUehN1AbrfHahS0rdVqWarb002dkJXPQiRHWBAOhGCTIU8hFOu2VuevnxYK6uJuf5k4VLoGz7jqU3pQtKmX6sSKCBJZKMtL57Yq49eOLWyQqVzdOU5LVDXB+yopg614ZC7+pjdRzE49UIDCIXEu9SQ9jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768073893; c=relaxed/simple;
	bh=fg14kcuG7sEkK6DBaOxh0G3+G0MJLBZT2Hb1acuuvlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X0vw2ne/ET2snQJi3UBqtEeeOOLcw9leG8oTtgsG1UzlqC+wVE4lKgAmHm6Cq9//S4SJAKF6DHYxy5DWOQxjAusS/BQRK3GApFbW7Ag6Hk5WKVL8UUuKrdAS0ILQkB55Pi2zjA8uxhD8uY/xp8SSvKB6wTD5S2w+7Rr+cyMEi/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXjkNgiv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CL35ecxC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AHmkFI323082
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	44E0YMx+5tHokjY5JA6iZJ4USE2acpUV/cer9MR6AVQ=; b=HXjkNgivG9EiPBSr
	H3tpl86Pn3z3IzXef7b/+XD4f8reqLrZyXmaif5m6sp72PjfmXx4iZ8QOkpcn0+C
	qNRKZxJRqF4CKds5O/MkYH49/tgeQ9FB2RlpD865G/8ipc9FXyl0yRs+fFdequKA
	xJZ4noZrWrlHj0UjD6stmcdACd883ZcrjYjeC6l4vCJenq71s9e7o7YpKja2aYNG
	XjZcG5WWw4W1oeIND3d1Pyp+688rwEwZjGlUkKy5tljuPtYwkYaTLf9iF+vDNyix
	i0Sj+eyT9THGAkh8GdPC0EmD1K1IPRjJFOWieKGcS+NbSXO+4SJC5xFK5nSAsPID
	P28P1g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bks258bja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 19:38:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b8738fb141so1120328785a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Jan 2026 11:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768073888; x=1768678688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=44E0YMx+5tHokjY5JA6iZJ4USE2acpUV/cer9MR6AVQ=;
        b=CL35ecxCIH/rR44HoDk7+SOz9Jc0mh051P7B2UvCZ9PCDhJVY/r2IhHgzQjk4RZzFx
         ag2WLKq7erROlO7DbNb+YgfYFmCkfhxWxI4eXR6L9fBm7r9KkBbBsl7xPN0YRTLaDps0
         shWPmTfJTSgnDgJmbtMlohyVPOvcsfTKzXkEHtZ0Vw2jthQ9gV8xdjWoYmIE9iHIXEw1
         gsA1w+GAFbrHhTAAbH1NuQQAtcfGWA5Sn5aSil1aZ2iBhM6NJgpBq6C2BQmzRAaxy8OX
         NoDMKpRVidQmEOYcbHJfM7fdAZUf8pFE7m0SwQLt11Ruz2TeLtc10JTdLL1SttWnm4dt
         9A/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768073888; x=1768678688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=44E0YMx+5tHokjY5JA6iZJ4USE2acpUV/cer9MR6AVQ=;
        b=VBtYupndi2qPnHgouDInbHTqhWNl5ZqbMScqzuTgtjFVnl/DUgouJTrdOO9iluuAse
         RgkP94G7vUwnPQBIqUbJq5GcIK34QnTIs5n/MvaTE/VZnjZU70BYM4jMohtDeqWywOtm
         H/llgmMp471Hq1Jcy4faV6CEZuIapgToyZ71ol03JiErS1s8kU2AiiX/kAe1XotFerwr
         7UBN/dLrmF5OdxdmdgJ3jXnxCIymDHaIdn9IN1N7abhqzHAla+s9yD4RIb7SyCTM9Vtn
         IuZFUObjDGwJKNII0mishFj27Q8EL6KG0IkNfqNNL8Atm8p3QW9CGJ20JkHf7rFuQiRK
         GWVg==
X-Forwarded-Encrypted: i=1; AJvYcCVMUobZtaq9XP5lazYkofj4LNaMnUWacDhhqzdmpVsxgo8TVNnEo3ckxPdqCdRdKXvzb48Z4Zyk4WhhJG/I@vger.kernel.org
X-Gm-Message-State: AOJu0YzUFmc7hGzThN0UrrSADgODn4dPHBsp/5E4ujjH2xNCi+k3t9qS
	5TcJcfWAztK7igngWzZqQse5CcHH5pXYwbnayQnzJQXoqfYvkLtduzZDRRsqXgLD4S3pBgu5gS9
	ZwdksK5vrVhcFJA4AAw5wu8qQvi8iMag7X40bRmcnb1ZOlh1Jp3BXBG+XEf3d35ICJ/68
X-Gm-Gg: AY/fxX4WXfeGYauD8IIJqr9kANYsf+Ls8EUsuIRiowF4lXJ9gVp/9rTAt8stWr79CgD
	Qmshwo/Zv7B4ywyA1OEO3mHBTD/ZCBBd356n0vjJCyqed40z5j6VgKimgLzqr3OUuA6qCKoldMS
	dq5YlxssTmjYAKPg3mZv/Cih2ep1PtTIXhxgAPEAHspUTOxPs94FJY1wOD1RSDZ+9+uLDbUWJNg
	vCKAxsrh/RIF1yeJlbJchINkOmpi5t3kUpFde2dk+2UrMaglJO0eX2eQxJ8tV+uTZL8/grCox8d
	lr1aFZzAdwK79R+Wi/TcZCV52zAw4BWp+psP3IMg0TwFav6MYVH31ujm8mLr/KoBUFGEgsKwvak
	iKS7rYFt6vbyH6jJmDDAl0MWMH8ySWR6Gaxa//HpBtpKzQU+EWmd4pAoyyv8PDZEZ31mC7yQ6OO
	uoL17w6IBvG+9BtAXZA2n8Ki4=
X-Received: by 2002:a05:620a:3911:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c37f54ead9mr2456981985a.39.1768073887823;
        Sat, 10 Jan 2026 11:38:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYrHPeQVAQ5a3qfu224MPq06XLRTO8fJCMxGIN7Nr+mANrQ7JIvuzpudnNJOXpcuYnKvhw7w==
X-Received: by 2002:a05:620a:3911:b0:88e:1be9:cf65 with SMTP id af79cd13be357-8c37f54ead9mr2456977785a.39.1768073887328;
        Sat, 10 Jan 2026 11:38:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0f6absm3539700e87.42.2026.01.10.11.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jan 2026 11:38:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 10 Jan 2026 21:37:59 +0200
Subject: [PATCH 07/11] media: iris: don't specify bank_spreading in the
 source code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260110-iris-ubwc-v1-7-dd70494dcd7b@oss.qualcomm.com>
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=fg14kcuG7sEkK6DBaOxh0G3+G0MJLBZT2Hb1acuuvlo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpYqqThF450ml1fy+pA+0PHm2B6NXSqtzr36AD+
 ljU4FlHNo+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWKqkwAKCRCLPIo+Aiko
 1ZzXB/4zieglXpBPj75KASN5PU2K9vLJef2+t+9cCIa679c9+TOd/xJhapOjVu9OZ0Z9hjIsds9
 iHGS7VfkyO/il1Q58SY1h0vN05uDi4RkmNwoOoNZAMNuuP3xpiScLVjtZv9QzLo9T1rg+D8unpS
 +fOrZ9Xp4JFOKq2ByDcA4s2SGfbdlYCCTwaDb40246PH0YB49alyQkXQoHQVSL4EUXSlx+1t6S0
 oAH12jWo3WuaCHXZ1RrCZ8SZ5lBLv4WXJ4eZT2mF/92QyIyff7wkGDVf0U/xT2CkvJIlx9dhe9R
 wbPwnqg5dY7HnNnMa6sDtU5RNGtHeaKqoEp2nt7LrI4TSBzc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3MyBTYWx0ZWRfX7Gspw7lk0uXg
 ArWbBjICiB3xl8yFOexhUnWzR5KJ3qf1r4IsxPuhVMkbGZrfav3wJFFV3DwaVrT6LEM76WubuPf
 w9rFjs6+GC33c2q9mn8j9SgflicvAGaxI0JEzKp0NbvcVkZ/H9uZEILfBGzgLmfOucX8xau7a7L
 mlsnX7wAPPI+aACuy3Sj28ExGG7LAq8Q0100kTGVeq2Dbi0vATAvhbX83+Vx9T5LxiODKSga6dK
 qxGP0RZRzPKrfHmdG+2X1mx5/hSbNW6lGUEh+Bje1Ms8Bm5aKftOIWoxEqAxUAQVUub8L38Sjg/
 W0rUIz5Z1g1Yr5XBhL3oKIw2oM74SWisHmdiQO1SCypoiGm2E2al7EwCpbYO+eq58/TpwCXcLgp
 yKTBkLKlLYJKq7r0bmDODyVIbeNmTLUuiPL1IlmamX9B4jgp2djbTsS6V4ZD7Vvtzvcxv/Bevq0
 /rixcKsIIeM69UF4F6A==
X-Proofpoint-GUID: FhOACpX5tX6p0stm_D80pEi7nbbVcOWw
X-Proofpoint-ORIG-GUID: FhOACpX5tX6p0stm_D80pEi7nbbVcOWw
X-Authority-Analysis: v=2.4 cv=EMELElZC c=1 sm=1 tr=0 ts=6962aaa0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=DVbmZvK3Bkzfg3EmCNkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601100173

The UBWC bank spreading is specified both in the Iris driver and in the
platform UBWC config. Use the platform UBWC configuration instead of
specifying it directly in the source.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
 drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
index a880751107c7..9945c939cd29 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
@@ -199,7 +199,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
 				    &payload,
 				    sizeof(u32));
 
-	payload = core->iris_platform_data->ubwc_config->bank_spreading;
+	payload = ubwc->ubwc_bank_spread;
 	iris_hfi_gen2_create_packet(hdr,
 				    HFI_PROP_UBWC_BANK_SPREADING,
 				    HFI_HOST_FLAGS_NONE,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 9f9ee67e4732..f99fcbb8fced 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -73,7 +73,6 @@ struct tz_cp_config {
 
 struct ubwc_config_data {
 	u32	max_channels;
-	u32	bank_spreading;
 };
 
 struct platform_inst_caps {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 0f06066d814a..c967db452dec 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
 
 static struct ubwc_config_data ubwc_config_sm8550 = {
 	.max_channels = 8,
-	.bank_spreading = 1,
 };
 
 static struct tz_cp_config tz_cp_config_sm8550 = {

-- 
2.47.3


