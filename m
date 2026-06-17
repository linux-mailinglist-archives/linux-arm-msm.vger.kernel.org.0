Return-Path: <linux-arm-msm+bounces-113663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4fIgJ6PFMmpD5QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:04:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B3C69B3AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 18:04:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AdHGiflR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SACm2TH3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113663-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113663-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1237731C079E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 15:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A6F48A2D7;
	Wed, 17 Jun 2026 15:50:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45C4A2E2C
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:49:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781711415; cv=none; b=huEf68yrIz82Kz4yhZLh/PQu2d4eRGO3IHxD0aSfsCccHPvlLwaqF1QgaoEdNUgO3JQgCmtCv21gdcXQQSEKs0iB44bkKHK+v+HxD52iw/ntE+tje1Xk8F+YsfF5CH4Q9HTWVBdfcZhgDV+0Rs0UfLMOS4FzhINi79VZ/ec2P7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781711415; c=relaxed/simple;
	bh=Bp4ha23nxC1mDcZYGL7VYoyCWPVxwAwZTBDRHRshtJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUPmIarM2TgLeaGQ+sbAmbo/lkNMmjhW0BtOs+Oj17ftYHu/iab09JWBxMVlFs8PLDsMal9yeppfBoCH11/JrJwCgx2A4R0tnZG20HOu6qWdOprF/YQSr7av+NJ5xHJHdZ3g1YuGsOl/yceVWjndaMIU4v4CPBlnmpSfjw4r3+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdHGiflR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SACm2TH3; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HFPqNL3127380
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CLBPgLd56WAROr6/RrPhGDVDj+jSNNxjX9noOZbjrVU=; b=AdHGiflRLbVnutnA
	Zy2EREmT+jqVRR1KFjqnme+a2r4ociAAb2WFU/Z4MacGvO8rgVcj1c7Ji9InpnUH
	z8KHbVOvpNGLqy9seK7LCiBeuR5YJuhiWF5l9ITPam+1Y66e8ljuhIW0ffkt+JGY
	l8dUqvcq5oNL25BMqYHhileZFcKG3eJBKbMZ/viRbG86vS+MU5Xgb/m9Oe3JZliY
	7feyyDPbfIpaRGeeNygf1pdY7QOX0nK0N58eOkmO8TjfTv2pfO/pJqST5bwblMuu
	COPF3g+bdoG1k7bnqJ8W/yiNPL3/N+T+5bLhxAfM9DUNuu01d0cucQCzSHxxpfmy
	79avPA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueesm2n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 15:49:57 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5bbc4919981so1015283e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 08:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781711397; x=1782316197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLBPgLd56WAROr6/RrPhGDVDj+jSNNxjX9noOZbjrVU=;
        b=SACm2TH3dGb6G6ET3pHgy2rKvak8Nv0vE2KFzZxJ0D3eracmoPbLeG2Yf84QbR8NpH
         KXgWm9FDB/PODAhjXFbkAFcQ6eKDZlQkZjtQPUPzS3ZWXWzPEMfq+WyVeTxZ2vh/AhDn
         zg9QXgfi6H8r1CHx5qYK1HWAxFJAufo+q2qBc3EX1hdG4SHC6Zz8zjLC1TcYUGThBBHd
         pn1h9gmfVMHfD7BE4LQP++2bx6sdWaXiJo9VgkhT2uN/5XDR79CzGNji93uNtEqS3TA9
         trK/3PVAupCyeFCe9wZ5jvm72GzYCN6v9tyLyzMAmvZiUqelyGfv/YG+qsTFrJ0DovH+
         MsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781711397; x=1782316197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CLBPgLd56WAROr6/RrPhGDVDj+jSNNxjX9noOZbjrVU=;
        b=bj4GCOtvJyS3l59ePuncXaphgmkWseYINL3d6GtETDtd0EilRXvNwAvNilW+8PFFRG
         u4TmvtByelc8CFDkAliUzpBpvSFke7SyMzKc67zzaPYYn1Oir4MI4bUO1HmGktbe5jf5
         PJNPdigxag9+EHcw4HvrkUm6d/XP0tHb2ZKD4WluxdP9QEKVDN4RFtzh9MRSdDjR52S/
         iy0VUEyPR5droDO2p6XxEg2EP9TIy56ytdxHclJKQuzTvtX23ukTsPpwQ+jt0WRhXAWV
         Vk5cnFl94PvRFbzS1CUULTu/1IfQL6MTvO3zVZEguqSZWYvr6G+zCpFnzCYUpo0XFdzg
         ssAA==
X-Forwarded-Encrypted: i=1; AFNElJ9Wx3Q5W1B23MMDiDTH3ZBAmLcnh+7sGIUOIqo4e3dD+cUumKNhNcb+CGMad0XysdHwBKopfWCrLqySNh8a@vger.kernel.org
X-Gm-Message-State: AOJu0YyNnviAeUDExySwtcoTQFfMcBtpN93Byy/6zdW1z9tl3o0CCUc7
	VTjX2kpXujakVgHbiznbLO3w6gSZMnOXKk76Fag5szCii1zarX2RR7O76udx7+xTStdO2iar0Ez
	Xgs6MlGz/9KfWZMfoDP6TxtBBYiLY/DOMUiyeVLW+7KNNxFBCC4Fh13lUMCWqsWO9OKgn
X-Gm-Gg: AfdE7clssvptJw1GDOr8n8hn35HiKRQ+pcY+lmcGkNueIWn0PiXKvkLZ7f1R2Q05wd5
	o85gvt4mAO8kyQ+A2qF4v806GN1AKCazTyhnwzpxMlUFIRUVEAPQ0BbIUdowiMWx0YSrFw1FUOQ
	V7Z0CWP8GviWTbo/tJEXq2Sr+D4rwsDmDLL+TN9/AdTUKYKaZ3QE5Pc4nCUZy0bdi5TFAjQqVq+
	SBN5lX/40l8mUy83l3oCpWrFFh5RUgO3QkD8QSMePI6mehRz1ANPyTuk8vZT5Zqy2fC74M0kbLy
	8cvBIKo+B7Y3Ose8+8g9RbxiVzeboN6WEJY33dtstg+v/Il0nG89Pj5odavEE9VqHVzBPdt2g5D
	7HBS1EX53JhiwcJnFAPOTSRc/DDNlqaO7yArIGyps
X-Received: by 2002:a05:6102:148f:b0:6dd:ea46:e3d0 with SMTP id ada2fe7eead31-7246cee5af2mr2729388137.19.1781711397109;
        Wed, 17 Jun 2026 08:49:57 -0700 (PDT)
X-Received: by 2002:a05:6102:148f:b0:6dd:ea46:e3d0 with SMTP id ada2fe7eead31-7246cee5af2mr2729367137.19.1781711396607;
        Wed, 17 Jun 2026 08:49:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c856:25e5:e249:5e0f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa8b423sm168913195e9.11.2026.06.17.08.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:49:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 17:49:31 +0200
Subject: [PATCH v3 2/8] crypto: qce - Fix HMAC self-test failures for empty
 messages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-qce-fix-self-tests-v3-2-ecc2b4dedcfd@oss.qualcomm.com>
References: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
In-Reply-To: <20260617-qce-fix-self-tests-v3-0-ecc2b4dedcfd@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5620;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Bp4ha23nxC1mDcZYGL7VYoyCWPVxwAwZTBDRHRshtJI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqMsIWIAZiBJDGNw8Iqnuq+SIxUNkSzCCc/OZ2A
 sVeharUG+uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCajLCFgAKCRAFnS7L/zaE
 w4MzEACggKk4q772WHbW13FlJpBv+fUA3pVWza6qpIBnHwVvozgZqJgcSTli9jzINf1pmT+rR9f
 FafBU72DqVEEgqHt2TpdV9xgealT7Kx1eLednydmQgVllwPj61P3FU1VF6zc9P9iPEyyiCCPlyG
 LpDSKcPO9XGVh4IjhhgbZN9Ph8jKKEb9SVriixVEG91YIJg/Qbg/ex5Ic77UsHEqo4M7rr8ZlSR
 vaJJiMcgRDs22GtETp8Zc1ThgqkS/DDPKi8uDhvj4t2GXJNHoWrCurl5KhC7rTUnUM2Paf4xVSu
 iQ0rNoThtQYOnUuTb4atEqRZSdh2mW2Dyj2uDjKFjlELK7/2oZzBYafDJ1ZCdMvDk/G80FX0koZ
 +XEH8PFUx35TC3WLXq/y4O0NpP3teBj/8K9dTP0aqbzTCZOudnw4lAzw4qwZNMN95Uux1YaxOOp
 U0CPRN70vxZoAWR9CtwV5Wz/9557swwC1SHywi11AVamZ34/Fz1+VL5yLxT5m0mT2Z94LrttZMK
 iyjDtkZVtdqkcSuKw2p+zniGEUB1W4H8ZWpp0onlh8bhAPiTTuwjaNz2cTfqB/jLQWnBDpTTSN7
 2bV4ydAIPjudLovnaUYCwQwWBfOnSP+/u0qV1HpfuYW9uN0iL71OtvDcMPidkTvbxm7zTMIRDyc
 5uXGZ6wHE/ymwfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfX1JIeHwqr1eIH
 /yMV+N6cKloNOZv3zgmoBxyYen0im0yC7ih93IsK9JaHuHxr9MKibLHFbrdiHALRuCZkRJKbxzh
 IxK9cm0+CE90YaThaoraJ9iN0w090qeOBRDz5r7fDYAkW0z0gYX/2wJx082yBR9TeA+xiScl2vq
 Hb+IX+CBtILBxnmZu8vAy0Sys8myFeLZTzwt7r8K2nLQb2cJ4x7V+aDTU/CVDpRGHa7rL5JQLD8
 gFRad70FOMvC3m+xr0V10+j5bOo4j0dFCgoUwIasHTxsAkIr37O+bUQmajS+9cE6mvCa+7qcFjT
 QnkmVBW6uVLjRLVKaafeTKJRW82CorCzLQp/MldiDsRht5iJr1BPfRCTleZkzT3tan6bKAiN3g6
 XVZUy5v8cw/YA0Z4fzTLnvsP/l/BpMR95APu//Jzd2cKxLFw7cGTnEVcwmI6jKjiMjrNKtv2ePV
 /qVb2mvBojCVVoswIIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE1MSBTYWx0ZWRfX3RsExHkdLmIC
 YvtYSKPaFhG1ad2yZxo4T4vpOc4BIki4UnZzAHlEFOAwqg7Pa142pcwwZMNyOI+0UuVcTZ5bsap
 gPJPIR4r5UwGd/Xo9WlZP2nmv+0eK3s=
X-Proofpoint-ORIG-GUID: DDm7O5mnfSwrD_Ufx9WNe24O0hNwrChU
X-Proofpoint-GUID: DDm7O5mnfSwrD_Ufx9WNe24O0hNwrChU
X-Authority-Analysis: v=2.4 cv=ePojSnp1 c=1 sm=1 tr=0 ts=6a32c225 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=p9FZT9qupOX1he3wxJcA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170151
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113663-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,gondor.apana.org.au,davemloft.net,mm-sol.com,oss.qualcomm.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:thara.gopinath@gmail.com,m:herbert@gondor.apana.org.au,m:davem@davemloft.net,m:svarbanov@mm-sol.com,m:cotequeiroz@gmail.com,m:kuldeep.singh@oss.qualcomm.com,m:ebiggers@kernel.org,m:linux-crypto@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:stable@vger.kernel.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 37B3C69B3AD

BAM DMA cannot process zero-length transfers. For plain hashes this is
handled by returning the precomputed hash of the empty message
(tmpl->hash_zero), but for keyed HMAC the result depends on the key and
cannot be a constant. As a result, hmac(sha256) produced an incorrect
digest for an empty message and the crypto self-tests failed.

Allocate a software fallback ahash for the HMAC transforms and use it to
compute the digest whenever the message is empty (in both the .final()
and .digest() paths). The fallback is allocated in a dedicated cra_init
for the HMAC algorithms and is excluded from matching the crypto engine's
own algorithm to avoid recursion. It is kept keyed in sync with the
hardware transform in .setkey().

Cc: stable@vger.kernel.org
Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/sha.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++-
 drivers/crypto/qce/sha.h |  1 +
 2 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/sha.c b/drivers/crypto/qce/sha.c
index 0a3f88aaf5169ea7b47a549bbc10ea87d3ae7a2b..d4d0bf88dea6bf1c58ee103cdccbbbfc266110e1 100644
--- a/drivers/crypto/qce/sha.c
+++ b/drivers/crypto/qce/sha.c
@@ -270,6 +270,36 @@ static int qce_ahash_update(struct ahash_request *req)
 	return qce->async_req_enqueue(tmpl->qce, &req->base);
 }
 
+/*
+ * BAM DMA cannot handle zero-length transfers. For plain hashes the result of
+ * an empty message is a known constant (hash_zero), for keyed HMAC it depends
+ * on the key, so compute it with the software fallback.
+ */
+static int qce_ahash_hmac_zero(struct ahash_request *req)
+{
+	struct crypto_ahash *tfm = crypto_ahash_reqtfm(req);
+	struct qce_sha_ctx *ctx = crypto_tfm_ctx(crypto_ahash_tfm(tfm));
+	struct ahash_request *subreq;
+	struct crypto_wait wait;
+	struct scatterlist sg;
+	int ret;
+
+	subreq = ahash_request_alloc(ctx->fallback, GFP_ATOMIC);
+	if (!subreq)
+		return -ENOMEM;
+
+	crypto_init_wait(&wait);
+	ahash_request_set_callback(subreq, CRYPTO_TFM_REQ_MAY_BACKLOG,
+				   crypto_req_done, &wait);
+	sg_init_one(&sg, NULL, 0);
+	ahash_request_set_crypt(subreq, &sg, req->result, 0);
+
+	ret = crypto_wait_req(crypto_ahash_digest(subreq), &wait);
+
+	ahash_request_free(subreq);
+	return ret;
+}
+
 static int qce_ahash_final(struct ahash_request *req)
 {
 	struct qce_sha_reqctx *rctx = ahash_request_ctx_dma(req);
@@ -280,6 +310,8 @@ static int qce_ahash_final(struct ahash_request *req)
 		if (tmpl->hash_zero)
 			memcpy(req->result, tmpl->hash_zero,
 					tmpl->alg.ahash.halg.digestsize);
+		else if (IS_SHA_HMAC(rctx->flags))
+			return qce_ahash_hmac_zero(req);
 		return 0;
 	}
 
@@ -317,6 +349,8 @@ static int qce_ahash_digest(struct ahash_request *req)
 		if (tmpl->hash_zero)
 			memcpy(req->result, tmpl->hash_zero,
 					tmpl->alg.ahash.halg.digestsize);
+		else if (IS_SHA_HMAC(rctx->flags))
+			return qce_ahash_hmac_zero(req);
 		return 0;
 	}
 
@@ -340,6 +374,17 @@ static int qce_ahash_hmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	blocksize = crypto_tfm_alg_blocksize(crypto_ahash_tfm(tfm));
 	memset(ctx->authkey, 0, sizeof(ctx->authkey));
 
+	/*
+	 * Keep the software fallback keyed in sync - it is used for empty
+	 * messages, which the DMA engine cannot process.
+	 */
+	crypto_ahash_clear_flags(ctx->fallback, CRYPTO_TFM_REQ_MASK);
+	crypto_ahash_set_flags(ctx->fallback,
+			       crypto_ahash_get_flags(tfm) & CRYPTO_TFM_REQ_MASK);
+	ret = crypto_ahash_setkey(ctx->fallback, key, keylen);
+	if (ret)
+		return ret;
+
 	if (keylen <= blocksize) {
 		memcpy(ctx->authkey, key, keylen);
 		return 0;
@@ -395,6 +440,36 @@ static int qce_ahash_cra_init(struct crypto_tfm *tfm)
 	return 0;
 }
 
+static int qce_ahash_hmac_cra_init(struct crypto_tfm *tfm)
+{
+	struct qce_sha_ctx *ctx = crypto_tfm_ctx(tfm);
+	struct crypto_ahash *fallback;
+	int ret;
+
+	ret = qce_ahash_cra_init(tfm);
+	if (ret)
+		return ret;
+
+	/*
+	 * The fallback is used to compute HMACs of empty messages, which the
+	 * DMA engine cannot process.
+	 */
+	fallback = crypto_alloc_ahash(crypto_tfm_alg_name(tfm), 0,
+				      CRYPTO_ALG_NEED_FALLBACK);
+	if (IS_ERR(fallback))
+		return PTR_ERR(fallback);
+
+	ctx->fallback = fallback;
+	return 0;
+}
+
+static void qce_ahash_hmac_cra_exit(struct crypto_tfm *tfm)
+{
+	struct qce_sha_ctx *ctx = crypto_tfm_ctx(tfm);
+
+	crypto_free_ahash(ctx->fallback);
+}
+
 struct qce_ahash_def {
 	unsigned long flags;
 	const char *name;
@@ -462,7 +537,14 @@ static int qce_ahash_register_one(const struct qce_ahash_def *def,
 	base->cra_ctxsize = sizeof(struct qce_sha_ctx);
 	base->cra_alignmask = 0;
 	base->cra_module = THIS_MODULE;
-	base->cra_init = qce_ahash_cra_init;
+
+	if (IS_SHA_HMAC(def->flags)) {
+		base->cra_flags |= CRYPTO_ALG_NEED_FALLBACK;
+		base->cra_init = qce_ahash_hmac_cra_init;
+		base->cra_exit = qce_ahash_hmac_cra_exit;
+	} else {
+		base->cra_init = qce_ahash_cra_init;
+	}
 
 	strscpy(base->cra_name, def->name);
 	strscpy(base->cra_driver_name, def->drv_name);
diff --git a/drivers/crypto/qce/sha.h b/drivers/crypto/qce/sha.h
index cb822fc334dc187cf1c66e2a332822a596ebcef3..2fa173ff2b2ec4031710ab6e3b14c28b04e0a746 100644
--- a/drivers/crypto/qce/sha.h
+++ b/drivers/crypto/qce/sha.h
@@ -17,6 +17,7 @@
 
 struct qce_sha_ctx {
 	u8 authkey[QCE_SHA_MAX_BLOCKSIZE];
+	struct crypto_ahash *fallback;
 };
 
 /**

-- 
2.47.3


