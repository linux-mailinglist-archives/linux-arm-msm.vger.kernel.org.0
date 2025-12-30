Return-Path: <linux-arm-msm+bounces-86950-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A10DBCE97F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 12:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D4CC303ADDC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 11:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049042E62DC;
	Tue, 30 Dec 2025 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nLzKyOg4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGKctO3I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DA02874F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767092557; cv=none; b=b686TyZ2UGuZLVX1TZmm+GRYnCGzF+DJXt8INW3E60Nn+Ekwi3OUe2dDUbWfsgJ5usoY/JQ6H+LZaeInqd/dIDIObTNDJTvyx9aJnaJ7cV/q9rt3UzP8L3Zdwy2Guj4hpxuZHOJzSh1kLzBX1qZpeLf0Pj1ZkrO5G9dNVrzHfuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767092557; c=relaxed/simple;
	bh=m50kh3FueoAo7RgZQTmW1gLTt+u3WeihoOaE+wK6BZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rmqJRLbdXqmexVi4Iu1rIh4Pr7I+IbNLUeRYmr98EQZRNz0U9fg4bglPVca9i7Pik7KQROL6OlK80UAQ6cbRj9qgjznzIUQULUyKdlZwR7ZX6sDatyCSNAJp/fDTbHS0/XtrM92G5kr0moFWVAnVEnKM6VOFoMqECKqPSDLgdAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nLzKyOg4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGKctO3I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU8k21t2284786
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uXOb6/A5UVi
	94XYfCLNblq+Mqdl95+smoRAtSR12Qsc=; b=nLzKyOg4PiyG2B1JCNk3PVrbwLP
	OsWjO2chMmmxsV4Hk/qNTO3EL1PW7WPYUAGr1SlIZRuBSAA02SCbqs7sxBot62g3
	na/gZ/Un+7qSOBP/0LASmN7tTWShrV6g0UrjCCZDxFEK+ter41AlnyEt5gR/e8LZ
	DC6/cMQA3HpHJgEjjbogb30bRrN+lMOh/vh7IXq34Srpn37AxBcgGH4M2cO+21kY
	GvxK2EfkBYNkxkwWGEFjUBxZUztjHso3CvchhzSM5g4jPW3sxfdIud4Iuys/i5yN
	el0Onvgj6SKVwxM/TygjBDwFoTiSeetjpINpfu1Z7tTzMNOwmm4/ylZc8oA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc06gsqb7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 11:02:35 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34c387d3eb6so9129140a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 03:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767092555; x=1767697355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXOb6/A5UVi94XYfCLNblq+Mqdl95+smoRAtSR12Qsc=;
        b=LGKctO3Iss10ji7nfpe1O1iOqsdVvMI9JsBqCiMGbzJnCAqNNFXmiWvTIWn9CPwSIT
         SwI4rNBO/CKBID88ssVHnLy9wKzeNMJE2aMUA5ESjb1HtfXIXkXzO3ddRTfdYihcahSO
         0BbiBhvOBDBo0slfRHu3bX4U83271uFOLva9alFzk61EG2L/BGdFn2KAX1gCZH88IlwH
         2bSN/nxAA+XXE+k5xZe8VhybzhbAFs3MZ2uQMKK7SO8yEW/BT+KsvCe1YJCVRMV68znL
         6EouNBiOL8TiiduaoBD8a3P+XnbK/wWOJ4g/uMGqYpO2QwYrXRx+zAFSBSSzbLbC/5sd
         SIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767092555; x=1767697355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uXOb6/A5UVi94XYfCLNblq+Mqdl95+smoRAtSR12Qsc=;
        b=Kt5sL/Gi3I+LfRrT0/lYbDDySTfNklTuZ1NF6+2I17HDpXbf59kg6lxploTo35jJ+n
         WwGijeYx0E250BvVsYFaKKwKi99o7Ck6OZCPVoPN4ojF00GfONzAZTKD9FvWI7SkBdWd
         l93knKxmHPqINiVjiYi4Q5P2btSDJU0+waDXc3X3q/0/6Wf3RCdyM7adp8Bu7FyH5hyi
         B/F2lnrtfjIpvNI6dBqdxwrDasMCIBSnJSOAUVuxZxEUj2Z8t+cL3AlbjcKfTQ8T/+mO
         XmP2eZRkew/folpUVqp590MeNNKXaXTqv1UDAUEmV8yVVjAFiJS4Kv6BjLUj49ZHqmv2
         wHnw==
X-Forwarded-Encrypted: i=1; AJvYcCWmsx6k8MDwcuxzQJrwmp5K8sRV/72+Q6/WpV5NEkzmkYDxLogrM10HYn04/JitBlQjKKXWuoCf1hEeoA5C@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx9EE0EOZltrPl90RkdZu6ChqAMMZBHPHfu2rYWoWjEGj1FTLV
	B2PcHMrhDLu+LNoewNdWGF9VxN+j9FFdTOOpUhhs7adcAAYlFopsofnqrFQ+1YJc2GGd23XToS0
	cUt0iabHud8/TAllgcxwom4ZJh7eOYfneUEGJEEFVdSQJutL4GAbNdSfAeyheMojekbKl
X-Gm-Gg: AY/fxX4/LwdMC1K2wXHiJLbfKyEjP9702y1c8yFkeauYsX8VesRukltgizJASFnlRED
	PQj6QIVFMV6A7B25WHHYXKqKcFcqoMXdvU7RG3rjx1E/JnmMTl5cuOcbehOh7kPj7K2dNslHt6y
	ni+csKWc1IR0RvcgjhxCTAnKGKuamIExtpp3IWGIlSOY5wGBW+nNyYsBG63twbAxppfVCGz5BX/
	nD5dqZDTdlXk2eCu6BeNw2IS4b3pKRJ1OVKazmXmkkMvRzKFsgWC97nySwFW/RutuA/lPvRtlqN
	IOxAT40zC6YyShovnpIG1GzcS7TNOWvyCqo8dKe5SCxgAYi9sbw1zsrMCcYZ69uBN/cbeOpQts7
	xLaejfEOXb5ABCHxiMo+YpzBxm495JMAOtchnQb3BHA==
X-Received: by 2002:a05:6a21:6d9a:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-376a94b9f40mr33065488637.47.1767092554747;
        Tue, 30 Dec 2025 03:02:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmzcXCgCAF/KfhFTejp806J8JhYinHBklMJhbJpOqY8ALnUh2jYcR9CnXOC5f6eAcCigeiOA==
X-Received: by 2002:a05:6a21:6d9a:b0:35d:2172:5ffb with SMTP id adf61e73a8af0-376a94b9f40mr33065431637.47.1767092553805;
        Tue, 30 Dec 2025 03:02:33 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c3a4deb6f17sm2556908a12.22.2025.12.30.03.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 03:02:33 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, stable@kernel.org
Subject: [PATCH v3 1/3] misc: fastrpc: Sanitize address logging and remove tabs
Date: Tue, 30 Dec 2025 16:32:23 +0530
Message-Id: <20251230110225.3655707-2-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: W-JL-z5JJT1l_g7m7ItZiebNNc2NWtpl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDA5OSBTYWx0ZWRfX3JsdzTL7F1o3
 Ibk+RdhfbKghc0VdNAU7fu2Rl7O4C7YAH7voCzB/1rxOfPLTfuQ7vOjLKwotikwPisNduivh7cl
 m/f76ObOIsm5nnpe6ZidrUiyqSfhc+USrmpp9Tjl93DyWoPtM1i1CmJcgZExGpXecvJirdyi86Y
 EHU74tWd0b/DpBXJmAjyxSw/uoaPA9f4Z1fnPQAZmQl+yQfCM2WOSw5UAumkROHymr3aWvndJfk
 IfktfaH42GpJ4K6+TMyrAqStmyIxIhJYDkj0dAsBqCN3+6YkDXjS3xbSWuQEoHPWVCkQ2Z9IA7W
 UHo5k9wz6thPGOy1/Ze89vXp0w0R9uNsMn15a9UD2M93ECxM+FVMM572pwDGbrxVjOL+J/Wz31p
 mKern9RgJPit/cPrXfgHwQZ/SvDICENzTKOKtPHtfLjaSPjWsyNlIQ9oOKFTgqVC9slp+pSK6Ip
 /i4zUY23O1CQuqAmTaw==
X-Authority-Analysis: v=2.4 cv=A45h/qWG c=1 sm=1 tr=0 ts=6953b14b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TXGx01ld9870rz7a8QIA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: W-JL-z5JJT1l_g7m7ItZiebNNc2NWtpl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_07,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300099

Avoid printing raw addresses in driver logs by using %p for remote
buffer addresses. This reduces the risk of information leaks and
conforms to kernel logging guidelines. Remove tabs in dev_*
messages.

Fixes: 2419e55e532d ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index ee652ef01534..408fe47e9db7 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1830,13 +1830,13 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
 	if (!err) {
-		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
+		dev_dbg(dev, "unmap OK: raddr=%p\n", (void *)(unsigned long)buf->raddr);
 		spin_lock(&fl->lock);
 		list_del(&buf->node);
 		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
-		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
+		dev_err(dev, "unmap error: raddr=%p\n", (void *)(unsigned long)buf->raddr);
 	}
 
 	return err;
@@ -1861,8 +1861,8 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	spin_unlock(&fl->lock);
 
 	if (!buf) {
-		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
-			req.vaddrout, req.size);
+		dev_err(dev, "buffer not found: addr=%p [len=0x%08llx]\n",
+			(void *)(unsigned long)req.vaddrout, req.size);
 		return -EINVAL;
 	}
 
@@ -1959,8 +1959,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		goto err_assign;
 	}
 
-	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
-		buf->raddr, buf->size);
+	dev_dbg(dev, "mmap OK: raddr=%p [len=0x%08llx]\n",
+		(void *)(unsigned long)buf->raddr, buf->size);
 
 	return 0;
 
@@ -2006,7 +2006,8 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
 	if (err) {
-		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+		dev_err(dev, "unmap error: fd=%d, raddr=%p\n",
+			map->fd, (void *)(unsigned long)map->raddr);
 		return err;
 	}
 	fastrpc_map_put(map);
@@ -2074,8 +2075,8 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
 	if (err) {
-		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
-			req.fd, req.vaddrin, map->len);
+		dev_err(dev, "mem mmap error: fd=%d, vaddrin=%p, size=%lld\n",
+			req.fd, (void *)(unsigned long)req.vaddrin, map->len);
 		goto err_invoke;
 	}
 
-- 
2.34.1


