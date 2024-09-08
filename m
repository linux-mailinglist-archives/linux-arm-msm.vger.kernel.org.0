Return-Path: <linux-arm-msm+bounces-31219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C75E4970922
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 19:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C24B528246A
	for <lists+linux-arm-msm@lfdr.de>; Sun,  8 Sep 2024 17:59:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD61617798F;
	Sun,  8 Sep 2024 17:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5I/sn6T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037B7171652
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Sep 2024 17:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725818354; cv=none; b=sd7FF9iJ1scuBmXlCn1kMP3cX+q/EVveCSOby8T3WULNiHe7Rk+Cm5A3MbR2TZX3LircN9mqGT8cUWf5WxJiowK/kNXC7aBsbFTPaKUYkArRahlQRPYA59O5rj+wtH9SENVjq23d9r5BfAujMtUOLzIkgD6rHG3yh3+pkVRU84A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725818354; c=relaxed/simple;
	bh=0jdGk3Q3+Sad3aXUFv1B1JF79Let28SGgOiB3qDz7Nk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HtkkA5HVD2Y/njZlPI0FQY03lnzbHKjAkmMspdlfgGHfnzOE1t3vm/Ob8uHjCGQc/AzWcqtr2dM3/SakIjRmk3PwqDLJoILS1Fb7a2Y2AfiGf5A5ptaTIKzE9RBz5U/vcklMSAjITrxknC2QITUsj47FbXuG7Zgj3NLA2ea94Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f5I/sn6T; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2f75b13c2a8so16919741fa.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Sep 2024 10:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725818350; x=1726423150; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SEXqofNVqvoQwq+AHz7mmjOEek3Vm7sXx+dlFFPiZAs=;
        b=f5I/sn6TScbHGVqodeFW4vSi5yg3hOkdn+GEmZul18raRhccGMCcBxiAbooMV8OUqR
         LvkfJRcLCpccuMPZkXYQEfJ/b6n+OFa3lKvxr/ro7QlwpLuJjp8EIInx5Mdc7T7/rAHq
         TXC62+ViqO1P9Fw0zHQ0CeNznLOInIHs8lW1hV9VdWQ5NiFk81qhYLQxVnsfqaBOUSof
         sqwhQLKCfHe+dqcaDKn3dgMa9dKJZMBsXKXPnVndiW/k/sLN7nRJV1IBo/Mn8MLzZ+Ha
         QyDNFkP8B7AowQoxlJXmOaCZN+DxBrjZYvuf+IqB06cbBprFHvq9xA8D6RoGUxPvhkDI
         ieMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725818350; x=1726423150;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SEXqofNVqvoQwq+AHz7mmjOEek3Vm7sXx+dlFFPiZAs=;
        b=ODRfaGirysh0vMmukfdTOFAeVU2pJOmaaSX0b7oiUa7JUTtmS333k6+axH4WOSUdyL
         qyuTcv7d/DXZ2fSrDletjU8dhgHPaHUhR3fTV0jcXYj/RBf+dYQkoNpfn1XHd7c8K/MR
         p6xrEDQ2jDQAHMn9d0KswmM6dgQJj42yJjXwUwX2kVbGy1wkTpf3RbJrOwOAGhUT049A
         QnHLRdFe/0me87k0TpJjPqTJVAjn5i3/tkyrR18MuIiv+xz5JBblZEPkEIfGN9Y7JMg4
         4ul2GCGcsf7KL+2WeS/KWnwXVk30i0E/N+nacdHzhTF3uSFtAHYdfJ7fqGmrK11omTyt
         6KXw==
X-Gm-Message-State: AOJu0Yzt8tP0J7QcoTeFWBTGpZ3HP4WxoqdDk1aLkUOGA09kXmXUvfdi
	KHq5lzStle87qontjJk81ENZxkVwONDSGIJXQk9nZbvsgyqgz/Llp2ENFSu2Njc=
X-Google-Smtp-Source: AGHT+IEJJSPQfHQyAHzH/XtH4ap3soyFL6w/2TJreb7bvtY+yZ9Cr18RM2/lxkp51Wa79pSkVKpIRw==
X-Received: by 2002:a05:6512:108b:b0:533:526a:cd08 with SMTP id 2adb3069b0e04-536587aadaemr6274831e87.14.1725818349192;
        Sun, 08 Sep 2024 10:59:09 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5365f90d9d4sm482814e87.296.2024.09.08.10.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2024 10:59:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 08 Sep 2024 20:59:07 +0300
Subject: [PATCH] drm/msm: allow returning NULL from crete_address_space
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240908-adreno-fix-cpas-v1-1-57697a0d747f@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOrl3WYC/x2MQQqAIBAAvxJ7bsHUg/aV6GC61l40FCIQ/550H
 IaZBpUKU4V1alDo4co5DVjmCfzl0knIYTBIIbWwwqALhVLGyC/621XUJqrDWqmVDTCqu9Bw/3H
 be/8AV/uMl2EAAAA=
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1238;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0jdGk3Q3+Sad3aXUFv1B1JF79Let28SGgOiB3qDz7Nk=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9rdp28Onojm/uTRETlD1z1nAvM69cvbpy3ZfPVCpjdb3
 Sy9Jwk6nYzGLAyMXAyyYoosPgUtU2M2JYd92DG1HmYQKxPIFAYuTgGYSEwI+/+CU2XLJtSn7c/9
 oS7/K2geX9YxPzXv88ILn7EGV+g/aAozWdhj+XHqRGsl9UuuKzIflAlkZmSXRuUv+zjhGEP9B5n
 /B7U+hS8KlDnnVOLbuNRv1hnX/ip/dn6WHL34RW6i3ivsV91SN75Todcmnqswr+jvhka3imXBFx
 OjfTInTK1OfOtYfOOU91dj7sAIFcFnSyNuNyjPZTXnKF100+BOUZPFzhURZ1Mz5Sff8Ttsq3fv8
 KOgn+/Wypl8SJmhttyaKVCP41h2c8jLTPVGlzNvOPXXGa/oDwj6klPuyy4reNt28cmM7dYpt5Sl
 j0guC9SXt9HaXHnoVhDvRZEPyRLnfPlfOoUsvPlu/gkmAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Under some circumstances it might be required to return NULL from the
create_address_space callback, meaning that the driver should use global
address space. Use IS_ERR_OR_NULL() to guard aspace->pid assignment
instead of just IS_ERR(). This plays well with the IS_ERR_OR_NULL()
check few lines below.

Fixes: 25faf2f2e065 ("drm/msm: Show process names in gem_describe")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index a274b8466423..47803f410dbb 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -833,7 +833,7 @@ msm_gpu_create_private_address_space(struct msm_gpu *gpu, struct task_struct *ta
 	 */
 	if (gpu->funcs->create_private_address_space) {
 		aspace = gpu->funcs->create_private_address_space(gpu);
-		if (!IS_ERR(aspace))
+		if (!IS_ERR_OR_NULL(aspace))
 			aspace->pid = get_pid(task_pid(task));
 	}
 

---
base-commit: 9aaeb87ce1e966169a57f53a02ba05b30880ffb8
change-id: 20240908-adreno-fix-cpas-48f3b992439d

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


