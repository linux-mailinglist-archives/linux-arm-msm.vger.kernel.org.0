Return-Path: <linux-arm-msm+bounces-100348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBFKBCSUxmkyMAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:28:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A4F3460E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:28:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 97CF4304A5B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 14:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6E434D919;
	Fri, 27 Mar 2026 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftK6QOdN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqrJWJPC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234DD3DBD61
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774621364; cv=none; b=u7zqJgomY1pkPpAyoBNTLKPgxcYv8yvpBp2/FUx82wtwTfzjCkQCoKAx2XLY+pvex7O5+2a3ZSgCtvKl48tDXiUk1mN7kSTtfK3SOXb5iWyayMZ4Flr90T4M+yuPLjPQfKu/GbUbN0XEjTzG3wk50oZDeYUggQjkK4HmDx7JfiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774621364; c=relaxed/simple;
	bh=EXXtyVL3ubYtT8z8hIMeoHRhpYmII/gnG1Id0FUfVTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nSNsGau2SpfcYfWdriDBY1S4X1PUSbuEsanjT3/JSTYXq05/bR/j3DzMMoFBs5Sd97nLrgJ5LJKUwiYifp12+SSdaSf6VgtqvCYBO/ihuInrowrxE+KxebkIeEi9+KxiYpaDLr46vWc5PfUq4MoOHueP2K7PaeDjwB6d0hDOke4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftK6QOdN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqrJWJPC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RDh68J3747817
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:22:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0unP4a+dA/bae42KNTobuM
	6OUVVIElujFQR6hRoxn+8=; b=ftK6QOdNlCDTT/bKZ1NYgj3BcJ4ofwsd8+faXw
	C00HY7j3g7jG2t/eiJO7mkAVHHs/6/mk6APYNNNHFu+LhAEYcZkpZXvr7CPq8PVl
	v047t4zj9UpOcOBAmeVfPmAFtxJCRCktImXhGzmsC0nva9CsSWbRnKQCaDhNgBdP
	EAFzjC/iG6R3Cr0JSOz93NRKIn776utb2XX7gxjyURE5FC9upzGhgt79mUkMvN6u
	s94WUns+w7uxV91MFnhhTYI2qqVdYlibuy8c3L/VkVaJePJ5gn8iR2m4fldSnzhL
	Q4/XLZRyzwY0uwwUUxe2MWtMU9op+YHTtAwjuYzIlyw59+vQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhgc7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 14:22:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4661881eso30364641cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 07:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774621361; x=1775226161; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0unP4a+dA/bae42KNTobuM6OUVVIElujFQR6hRoxn+8=;
        b=HqrJWJPCZJqWmdXWfbXLdlXyJdZ4r9U25j6dOvsi3lqtBJZwNjWmbNG49vEueEI+iq
         /EviWloQM1P4o4HuIqSmUXrtleAR2tvg5JzDfuI62Dz/fh5TCcCnn5rK5ksT4X4lk0/r
         4BuANMVQwfMIoAWI/ozxs4o3eEW8CBlsRNoRbWFOSHWRHstZ2BvDITsnyi7BsB+MWsC0
         vRb2vZXVQiabiznOhAbXZSR0J+C9drDJCi3VeYX9rGI3PrWDIobpfi158UOVObd9/5Tb
         BwsV2exJRo5fdA6hZADW1VRzQe0Imv25Q8TbwnkueCiu/OFipozT8FYsVlzjBtkcC7v5
         B4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774621361; x=1775226161;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0unP4a+dA/bae42KNTobuM6OUVVIElujFQR6hRoxn+8=;
        b=Nen3i6KipJK6RJ86E23bmkF3FmjnpyQ67NM3LHwFIbRlR0f7myhUKUfDET2cvmBC8K
         WHRWmDBCQ4BfxCuXRhaQ97x/vY/vHrhnk+AHJmhBE4gul3aBNozPZP8FnGi+2nkeFuwC
         m/bVOI+ijqagmOz1Zd3VId7+piuxpsy2q8tu90O9uQAPUG6gfzDQTg2HWO8cOFzvKnBn
         hLwDYmaKXKVpMNunO2N3VWHyIxJEYweSrlEDKtKtdu3P9XEHTP3lUyHNOipYsTdBH75C
         pxtrPjRxsDSpBuyO+WTxBYb45r1WS27ZnVTWy4m5UWp5wW1YElv48dVmMBBLXos+tiGd
         gWjw==
X-Gm-Message-State: AOJu0Yw+kXtUVuQTICVNM0TKdIAucIUSlCqYRgCqns/qhOA7/dEUOcfZ
	8QORPKh38qNWUxrZS3AYyEZOeelrn8ZR9BN1TiSutcDnExmMKYX02svo0AliPdMaVp5cSkKsziL
	8dvnElI0nkjp3sHpv28Lt/zc8O/lCQtWz9uxIEPeziUvTF1G1C+sKW9eibINn4l3wBCex
X-Gm-Gg: ATEYQzwNpTg+VrCN603bRuErQV+MWVtCXRidl6f8WvYTrSttSMet9wtfjc4LuFrhh/z
	FK43EyD4nutqk7zr73CfgR7JypE/uFTr2CZRT7rzJtQqAinds4JCuknpySamYe4Nzywhvszpk2v
	/xZ6GzBfPwidUGcNgL/bJ6jeZPMCYIkWsYRcLc1b8tC9amBOJ1vaeaFUIFKhg2ZBpWgb87RURu7
	06TVkTIWu8/xoeuxdQqh1o4OzefuAySY+njdhcfe/e1MeU48n4Cui3ajR+3K7+bJ++aTFx3O6+N
	j4h304A7xgYCNOJ6cO+g2M1hoEz8AFI7wLHAbkCHDzR8AxZ3w5wy+xKiCEj5oMAHL7dvJ6OmFvK
	aGhjUzl2TUkoCc8WXYTANe8R8sQs=
X-Received: by 2002:ac8:7fcc:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50ba38095c1mr34236351cf.8.1774621361331;
        Fri, 27 Mar 2026 07:22:41 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:4f1:ba0b:90 with SMTP id d75a77b69052e-50ba38095c1mr34235671cf.8.1774621360790;
        Fri, 27 Mar 2026 07:22:40 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722c789ecsm97055405e9.4.2026.03.27.07.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 07:22:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 16:22:33 +0200
Subject: [PATCH] soc: qcom: pd-mapper: Add support for Eliza
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-eliza-soc-pd-mapper-v1-1-17334d6ab82d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKiSxmkC/yXMQQ6CMBBA0auQWTtJGUIxXsW4KO0gQxSaDhoC4
 e5UXL7F/xsoJ2GFW7FB4q+oTGNGeSnA9258MkrIBjJkTUUN8ktWhzp5jAHfLkZOSLV11yYEQ6W
 FXMbEnSzn9f74Wz/twH7+rWDfD4NBNH93AAAA
X-Change-ID: 20260327-eliza-soc-pd-mapper-256a87dd0216
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1185;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=EXXtyVL3ubYtT8z8hIMeoHRhpYmII/gnG1Id0FUfVTg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpxpKuCqjjQkGdAfalic9BjDCQjEwvaeV/u9huQ
 VrKFNXhMo+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacaSrgAKCRAbX0TJAJUV
 Vg0XD/9JaoCU0BXANyl4gkhfyjJTOmVDeA0OgKmn9KXoXo8yvU+/8xhuqu/Zp+UyZ3ldt7WAMo0
 PEPjAHRIM9g0TJHuNBBfBktvVF1jbKunu8yQ+vWD5fNbp6ORkfsv199YQ9P8P9+ppw+dhEXC8Rh
 wDuviaS2HXQyTjbg8egzZIlCZRWIcMego132V2YomEQ1AuaVnm0uGI75pr0wANtbalr89nDXvDD
 +q4IT/7QJdd22/QxdW7Q49UvGGZbnLLilAOZV7dBxYHDBqQ8ZjOjPsN9nJGz2vmUMjmzczk1yMB
 Mw7D6iRUdsSs/h1/yT7JIMO556Ar3ofaFvWzEXEsF1kTNhYz8mcMP+wbJmACss5hnNJAjWF2hT4
 7GO5j/+ZbA5UxaGji15eJjfKIwtV/msSaw7XuP9IK2VY79/FLMOUeBlCKKKAcE6wwwchYW8VLYD
 SqHsX46DQFStfzVY7W3M/Ood2XNCjhbI8Q4eLEaKoPBVFrzyzwxNsTCpACpasR6eU9UCArjO4Dm
 AMZnCw5K2VL3/pJjhZpvNIkKO/SaCDYIIPKlV31x4NidhXZVQkw6Vwq6N6+T77Sq2TC0LgeYgs5
 CwK7jRFv1Wkz7Hqw30avIeXXFh3z7OoF8+l53w4kcdcz4W4V0TsWe1tJmQIB3bNEk1/p9bgAJRg
 yj5uOQEEk6kMUxg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c692b2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kjEftqUJDdny0hUQaisA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 5lzurIaYoRoRBEBHhvkZHHJYjCFxW7NA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5OCBTYWx0ZWRfX3w5lp3ODLi1f
 OLfpscMc8scfU4AzO/BE12UIyxbxvIPNOwKzfDOPOFQai3+kxMA8AlSg/x8hgBYG29r6kaQ20dQ
 UA0UZd2D25yy6VN38eQ/IjfHgK5ZoySsGz77vjiSWkwbLyav1yptI3zDyOvLKkP+Py2FSH+Ze6j
 w9fEfQY3qJ8Njmdl9rzYQRfPHeDpMUfjcxIuH/b8mRknUDTlRd+BvLiXvqqc3vkHx5YcNcdrdLA
 JZiY3oBrFAKVm4tLYmLkJ5qN3/Of/umNSEfjaSTOvSnWKSOVSt9K9Os2eSTnC+UB6Jkb6Zq/2pL
 1uhSV1f+MxyDkZu3NcDtiJiFzERWpkK1MzSvgZqaxYjzqilAVRXrPqwvGqb+rvcdU3BQRJH2+Rh
 WPmTaZHx/6IlvEN0tWGx5aEpHJSSZex76FAhu8HfqCL+njNrc7nknPUAh71lTf6wJnjP46Wm6Ox
 1z4Xe/Y39ODsh09J00A==
X-Proofpoint-GUID: 5lzurIaYoRoRBEBHhvkZHHJYjCFxW7NA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270098
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-100348-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67A4F3460E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add support for the Qualcomm Eliza SoC to the protection domain mapper.

It has the same exact protection domain configuration as SM8550 SoC,
so reuse that.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_pd_mapper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
index a18cb56de579..7bb14c20ab5d 100644
--- a/drivers/soc/qcom/qcom_pd_mapper.c
+++ b/drivers/soc/qcom/qcom_pd_mapper.c
@@ -578,6 +578,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
 	{ .compatible = "qcom,apq8064", .data = NULL, },
 	{ .compatible = "qcom,apq8074", .data = NULL, },
 	{ .compatible = "qcom,apq8084", .data = NULL, },
+	{ .compatible = "qcom,eliza", .data = sm8550_domains, },
 	{ .compatible = "qcom,apq8096", .data = msm8996_domains, },
 	{ .compatible = "qcom,glymur", .data = glymur_domains, },
 	{ .compatible = "qcom,kaanapali", .data = kaanapali_domains, },

---
base-commit: e77a5a5cfe43b4c25bd44a3818e487033287517f
change-id: 20260327-eliza-soc-pd-mapper-256a87dd0216

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


