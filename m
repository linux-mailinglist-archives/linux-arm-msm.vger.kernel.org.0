Return-Path: <linux-arm-msm+bounces-115889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FGfuNI0zRmq6LgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:46:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D7E6F5765
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:46:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=lba82xM7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DSzhgDKf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115889-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115889-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF1BE30855E2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB75481665;
	Thu,  2 Jul 2026 09:37:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12DC48124B
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:36:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985021; cv=none; b=UM0mw4J6pQAtKhtzDReSUvk7uyrBqa+2vHBwCll1CRrn7RvDfnDIp1JdtqXUUI9ilOMgjvYjf8NBRflASz6yMcjKmBcHh6Rt+p+sK+2El7sha8tl49Aw8gszy8CLUj+gCwbWU6H2M0KuKx1PV7zMFCFCHWaYa2N1qvIKhye9w7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985021; c=relaxed/simple;
	bh=REG6+aa6GfDD+CkcLqDsKzEN3hrOPesgI+DFf4KGPkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fKD+f83ykTLPNzw1Ca4pS9AsoYa96wJBtpzgIBIN+46pgUO7BJ4nis51lUo11rTE1sPuLh+U803jIq7ef+zDU6uPc1RIkX1Hz1atkp33PHAHQZ8f06Ti36EnRyW/k8dWFd9P9IMUSxxbE2tD+LGhrQqDD8bG2f4aL3lQXwTYKHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lba82xM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSzhgDKf; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6627TuNS3964270
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MctYkjewwWBGvbfRpPa8310fss6i++Wo9tL49fnfFqQ=; b=lba82xM7SIyC4KWE
	1IlWvz1n9Dyhas2t226nZBxJxFXkrIT1QMaci9iJNJWasSrxKC2vMLLpmjDuEq2C
	7Ps8bUCtXnEhOni/zaHVrCgP6/sZjYTZKWbwlF3wdR4DnyxGxLOPkK9tO0Mrqwhu
	sh+kOkEI9E8r4tbmO/mjGYmOEtt7CN1aUyP2LueG8Lb8l2btk334uwQBcgRr5hut
	OMgnX/7IRlxSOraP4rM4M3ddbX4gnR4Ss/0r+92c0/rj7sWOXFS5JT7LwCSdUG/S
	mBJGR+lgbZ2S2NLQy/LEZoAKzbQwsyJC1gRh7Y/OV9VU2PWN1iOxBIVdOKn4qsCF
	DDv3JA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5knc0gq4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:36:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ac0a54110so212149185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782985018; x=1783589818; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MctYkjewwWBGvbfRpPa8310fss6i++Wo9tL49fnfFqQ=;
        b=DSzhgDKfCKosLhaABYqEQ60avAFJsu15ToFaFXBKNOByrCJGJBnVE8vjaEHiRGK5A5
         4oKewpvi0W76j1bLryjb9pdFvu/e69MRHay8lkznS+C0rJ/uLQTPjgu6XHEGe+0Z+QNF
         bdJDAgLMIokPF8aUq4CFIwzSEgHyvHuhnzO/ELRUujTu9TXyKNvLN4BQnsVnSVvgFUUz
         bH6y/rygzB73d4LyftF/2EqpbKe94/7J6ByHFELUEHj2dhGfvoVdHd+mHblNi9g09GgQ
         13zyRKU+WxuKm6CneEfwwmZC4eR+qHVbtVcgWcVxM0gIVHiCAFyeWA2Yp+5jYkeF/hu8
         ksPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985018; x=1783589818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MctYkjewwWBGvbfRpPa8310fss6i++Wo9tL49fnfFqQ=;
        b=pte4lD+jpakTDtoa3zIq5ikn4s5T+vcfwBjoUZaEvBwxNilSR7i9f8EtIbrmtQfE05
         hBN+hi0iXiDxXlHr+ZwqtzDfkUNzA8zgXB1G4pGrEYk659w7Qi+So+Hx/QC82VVFwu1T
         /alZOFnvy5R4pNgHJafU13BU2K1u2nle2AfkNvqZNHZFeVEY7kitoUV04HtHzNtfEz/1
         QcI/XRbEplab0l/utdYUVTF6WZdg7Z8m59zS5c2tONDedCId6gP001y9YU1hPtRKtkAo
         LB20mFI0eLzgHsxXIsejU89ZPVfv5kfa8cXgZPW/E810WLE7cGQnGegq1cl9juKe23Zh
         5Wjg==
X-Gm-Message-State: AOJu0YxYeNBxUdcKJ6nQBJkqI4aIBwpCQGEhFp7Hdglr8LejtSaTTnzk
	GebUX0z+FovmN/m9tbOSyXUboTj2WOKb6UbHEYPnZW8NgFsmucU/Br0iVwlWqKwcTZ6aCYiAY7K
	09eXAHIhmAdz2CQPzVxCuJm7IFXkT9+zv1WIGwLHiWLzBhSi6vzYpZRQ/A+8ihDcq+K30
X-Gm-Gg: AfdE7cn97pPGr9bjtT7tnucV3uJAruVaNyK70CgU8EgEQ5/Y2zhakhv8k93v1rGJByX
	zG/TtTPTj3DkH22y/u34xlXZQqtfyxa4NiCuWJPOINLL3ga+gZiKdhtk/2ja4sL5wDnfXR0ZBt1
	EjfYrEf+3h5F3pCT9LsW64MMi4AcfW+8g05vZq6FkX8sTKQwN4ZV51CLV9JXzOPi7EAVkV+kDMd
	3at/rZ91xLtv5rH0M5qsSSym7GJRmGX6SIRrkGIFzt+a0X2PRrDXosTt9tTBub6ECnpoaKdi8Jt
	fFREUfdXKVeqrZaZECLZNMcX51bPJg5qPcqA4hA0tOaBqGASBqst80UJveTaOcf1LscWbB6ukO7
	XDY0hzhL+YiM57qZYyldUoioW4ve6a/zJ+ZM=
X-Received: by 2002:a05:620a:470b:b0:915:9984:5781 with SMTP id af79cd13be357-92e784da439mr669217985a.51.1782985017993;
        Thu, 02 Jul 2026 02:36:57 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:915:9984:5781 with SMTP id af79cd13be357-92e784da439mr669214685a.51.1782985017477;
        Thu, 02 Jul 2026 02:36:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db3db964sm7101335f8f.8.2026.07.02.02.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:36:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:36:41 +0200
Subject: [PATCH v2 2/2] drm/msm/hdmi_hdcp: Simplify register bit updates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-drm-msm-hdmi-cleanup-v2-2-a4a4f0e8895b@oss.qualcomm.com>
References: <20260702-drm-msm-hdmi-cleanup-v2-0-a4a4f0e8895b@oss.qualcomm.com>
In-Reply-To: <20260702-drm-msm-hdmi-cleanup-v2-0-a4a4f0e8895b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9452;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=REG6+aa6GfDD+CkcLqDsKzEN3hrOPesgI+DFf4KGPkY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqRjEwf6QsDrWHy7jFhsHk9EtzBVZhEHAnyKolB
 squMmAFAWiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakYxMAAKCRDBN2bmhouD
 1x9QD/9Y8yGAdCkCTkts6vmz8HgHF7seJC3aS4SN2cWzLE5IzBotb68mYpabPNkkPcIEbakJk2u
 E+WhMzK2DVAARORyURTQDjlQsNss3M8habEyy8TEV3pQNTybaImr14cXdJVCaAN4IyTW3f8KLPJ
 M30xVMIbI7aE3YilqME4BtK6nVLX2zN7j6BdCefX6Ie+dRUrTGv25vRACuehkOwTs93oz3W7v+Y
 PHi+uyqV945MeMb6ZNOLQqQShOC5y+37e4/KHldBjn3B8iT4E3Ppz6alETdqsUYJbd0QC3l38nj
 z3maOBdQfxiycIVPxb4QRYCHW4c1MIkiF78w+8osQymeO58XouF9ycqxd/4nrgEFI4u0l4UmmX6
 knpvUVGO/MYTq12jnvVHBDQJ9cBInsuJSH5/dEPW9mrhNWyllB8gxkNiMhrxM2CLps/lugrwt/i
 UXfhiQu6pciVdzeqbdyBNalCe5TI66wW/bNEgtoYc1s4HbGRf8iJKF7g7DmIDsHZC5GRmJWGE6O
 aFUXu704risoZXe3Qtyu1F1eeruaWgQMnVGm3NspumPI6qcYG5DNyc9Zc5H10+/Sjoo8ovUwzlJ
 T4D1smQORVro5kugajqKZgzvZXcvfaAMBE4EZ/EzILaKwaN8aqbuqUblb6LUR0oMqxQbTLLtI+R
 ruf5zIzSG/jrL8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: j1xJl9JQmE_icj93LeUxo7JtOlBAFYuw
X-Authority-Analysis: v=2.4 cv=a4kAM0SF c=1 sm=1 tr=0 ts=6a46313a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=kVIxuixzSQivcz-PG0cA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX/zjVwY+nOVG3
 CXpkygoeCIcsFuCLI7g64g8INa1I9yvhAy1sHW79X4bwMHjbqVPHMNun2j5nsc7lop9MMWUU9a0
 FGK0zh7jg+5lwN7P9p8uQQx13dmhu6nhn358O4KBacRz/8q5haVBDxZKqyEglppJYSvnz3YsNEd
 v0tWRgsjdbi9xMDJbGA/aUuUJX+2GeAw8wMaTb3ZCGI2V8VqW7WI6pyaWYYO62etCC/RZjzGfw5
 BBwC01E7Ha4xgAjyZXgWkdGXDy4J1L/2hnAurxyVMOQQbkzbxc2y54DyhIcO2NhHjO+ssp8fZZX
 4Vw0r9lKe+UDod9AE2T4GKme1go02iK08XmT6Tz1Ekan/cdRqvBES8iQlnf0dPlwwSo/mzSoB6C
 vwcn+7miTBhHR7rdNKh7Ckzq+9ZeNeIl9huPS66kcnlKA9MjHFCl2OGuf+ilNLOLjmXcfDeNp6Q
 B7HM55Y3ZPzt5N9W2oQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX6/qHbCCcJZP2
 OpoNe0IDga6owMt27uqYD6FxID1BTS9Ogj+KHc3RDrHMcuJub7fM8y+3Wf+CfFaW2pnLuXySSVg
 g233y6lg35gXu+AFl3Z2+PvoHRhPiaQ=
X-Proofpoint-GUID: j1xJl9JQmE_icj93LeUxo7JtOlBAFYuw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115889-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76D7E6F5765

Simplify reister updates (read, apply mask, write) with a wrapper to
make code more obvious and avoid possible errors of reading and writing
to different registers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c | 85 ++++++++++++------------------------
 1 file changed, 28 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
index 8fb5497aac9f..7862bd67d154 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c
@@ -306,9 +306,9 @@ static int msm_reset_hdcp_ddc_failures(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 			HDMI_HDCP_DDC_CTRL_0_DISABLE);
 
 		/* ACK the Failure to Clear it */
-		reg_val = hdmi_read(hdmi, REG_HDMI_HDCP_DDC_CTRL_1);
-		reg_val |= HDMI_HDCP_DDC_CTRL_1_FAILED_ACK;
-		hdmi_write(hdmi, REG_HDMI_HDCP_DDC_CTRL_1, reg_val);
+		hdmi_update_bits(hdmi, REG_HDMI_HDCP_DDC_CTRL_1,
+				 HDMI_HDCP_DDC_CTRL_1_FAILED_ACK,
+				 HDMI_HDCP_DDC_CTRL_1_FAILED_ACK);
 
 		/* Check if the FAILURE got Cleared */
 		reg_val = hdmi_read(hdmi, REG_HDMI_HDCP_DDC_STATUS);
@@ -324,28 +324,22 @@ static int msm_reset_hdcp_ddc_failures(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 		DBG("Before: HDMI_DDC_SW_STATUS=0x%08x",
 			hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS));
 		/* Reset HDMI DDC software status */
-		reg_val = hdmi_read(hdmi, REG_HDMI_DDC_CTRL);
-		reg_val |= HDMI_DDC_CTRL_SW_STATUS_RESET;
-		hdmi_write(hdmi, REG_HDMI_DDC_CTRL, reg_val);
+		hdmi_update_bits(hdmi, REG_HDMI_DDC_CTRL, HDMI_DDC_CTRL_SW_STATUS_RESET,
+				 HDMI_DDC_CTRL_SW_STATUS_RESET);
 
 		rc = msm_hdmi_hdcp_msleep(hdcp_ctrl, 20, AUTH_ABORT_EV);
 
-		reg_val = hdmi_read(hdmi, REG_HDMI_DDC_CTRL);
-		reg_val &= ~HDMI_DDC_CTRL_SW_STATUS_RESET;
-		hdmi_write(hdmi, REG_HDMI_DDC_CTRL, reg_val);
+		hdmi_clear_bits(hdmi, REG_HDMI_DDC_CTRL, HDMI_DDC_CTRL_SW_STATUS_RESET);
 
 		/* Reset HDMI DDC Controller */
-		reg_val = hdmi_read(hdmi, REG_HDMI_DDC_CTRL);
-		reg_val |= HDMI_DDC_CTRL_SOFT_RESET;
-		hdmi_write(hdmi, REG_HDMI_DDC_CTRL, reg_val);
+		hdmi_update_bits(hdmi, REG_HDMI_DDC_CTRL, HDMI_DDC_CTRL_SOFT_RESET,
+				 HDMI_DDC_CTRL_SOFT_RESET);
 
 		/* If previous msleep is aborted, skip this msleep */
 		if (!rc)
 			rc = msm_hdmi_hdcp_msleep(hdcp_ctrl, 20, AUTH_ABORT_EV);
 
-		reg_val = hdmi_read(hdmi, REG_HDMI_DDC_CTRL);
-		reg_val &= ~HDMI_DDC_CTRL_SOFT_RESET;
-		hdmi_write(hdmi, REG_HDMI_DDC_CTRL, reg_val);
+		hdmi_clear_bits(hdmi, REG_HDMI_DDC_CTRL, HDMI_DDC_CTRL_SOFT_RESET);
 		DBG("After: HDMI_DDC_SW_STATUS=0x%08x",
 			hdmi_read(hdmi, REG_HDMI_DDC_SW_STATUS));
 	}
@@ -399,7 +393,6 @@ static void msm_hdmi_hdcp_reauth_work(struct work_struct *work)
 		struct hdmi_hdcp_ctrl, hdcp_reauth_work);
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
 	unsigned long flags;
-	u32 reg_val;
 
 	DBG("HDCP REAUTH WORK");
 	/*
@@ -409,9 +402,7 @@ static void msm_hdmi_hdcp_reauth_work(struct work_struct *work)
 	 * AN1_READY bits in HDMI_HDCP_LINK0_STATUS register
 	 */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_HPD_CTRL);
-	reg_val &= ~HDMI_HPD_CTRL_ENABLE;
-	hdmi_write(hdmi, REG_HDMI_HPD_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_HPD_CTRL, HDMI_HPD_CTRL_ENABLE);
 
 	/* Disable HDCP interrupts */
 	hdmi_write(hdmi, REG_HDMI_HDCP_INT_CTRL, 0);
@@ -431,9 +422,8 @@ static void msm_hdmi_hdcp_reauth_work(struct work_struct *work)
 
 	/* Enable HPD circuitry */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_HPD_CTRL);
-	reg_val |= HDMI_HPD_CTRL_ENABLE;
-	hdmi_write(hdmi, REG_HDMI_HPD_CTRL, reg_val);
+	hdmi_update_bits(hdmi, REG_HDMI_HPD_CTRL, HDMI_HPD_CTRL_ENABLE,
+			 HDMI_HPD_CTRL_ENABLE);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	/*
@@ -456,7 +446,6 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
 	u32 link0_status;
-	u32 reg_val;
 	unsigned long flags;
 	int rc;
 
@@ -472,14 +461,11 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
 	/* disable HDMI Encrypt */
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val &= ~HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED);
 
 	/* Enabling Software DDC */
-	reg_val = hdmi_read(hdmi, REG_HDMI_DDC_ARBITRATION);
-	reg_val &= ~HDMI_DDC_ARBITRATION_HW_ARBITRATION;
-	hdmi_write(hdmi, REG_HDMI_DDC_ARBITRATION, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_DDC_ARBITRATION,
+			HDMI_DDC_ARBITRATION_HW_ARBITRATION);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	/*
@@ -498,9 +484,8 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 	hdmi_write(hdmi, REG_HDMI_HDCP_ENTROPY_CTRL1, 0xF00DFACE);
 
 	/* Disable the RngCipher state */
-	reg_val = hdmi_read(hdmi, REG_HDMI_HDCP_DEBUG_CTRL);
-	reg_val &= ~HDMI_HDCP_DEBUG_CTRL_RNG_CIPHER;
-	hdmi_write(hdmi, REG_HDMI_HDCP_DEBUG_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_HDCP_DEBUG_CTRL,
+			HDMI_HDCP_DEBUG_CTRL_RNG_CIPHER);
 	DBG("HDCP_DEBUG_CTRL=0x%08x",
 		hdmi_read(hdmi, REG_HDMI_HDCP_DEBUG_CTRL));
 
@@ -537,15 +522,12 @@ static int msm_hdmi_hdcp_auth_prepare(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 static void msm_hdmi_hdcp_auth_fail(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
-	u32 reg_val;
 	unsigned long flags;
 
 	DBG("hdcp auth failed, queue reauth work");
 	/* clear HDMI Encrypt */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val &= ~HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	hdcp_ctrl->hdcp_state = HDCP_STATE_AUTH_FAILED;
@@ -555,7 +537,6 @@ static void msm_hdmi_hdcp_auth_fail(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 static void msm_hdmi_hdcp_auth_done(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
-	u32 reg_val;
 	unsigned long flags;
 
 	/*
@@ -563,16 +544,15 @@ static void msm_hdmi_hdcp_auth_done(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 	 * there is no Arbitration between software and hardware for DDC
 	 */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_DDC_ARBITRATION);
-	reg_val |= HDMI_DDC_ARBITRATION_HW_ARBITRATION;
-	hdmi_write(hdmi, REG_HDMI_DDC_ARBITRATION, reg_val);
+	hdmi_update_bits(hdmi, REG_HDMI_DDC_ARBITRATION,
+			 HDMI_DDC_ARBITRATION_HW_ARBITRATION,
+			 HDMI_DDC_ARBITRATION_HW_ARBITRATION);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	/* enable HDMI Encrypt */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val |= HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_update_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED,
+			 HDMI_CTRL_ENCRYPTED);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	hdcp_ctrl->hdcp_state = HDCP_STATE_AUTHENTICATED;
@@ -1304,7 +1284,6 @@ static void msm_hdmi_hdcp_auth_work(struct work_struct *work)
 void msm_hdmi_hdcp_on(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
-	u32 reg_val;
 	unsigned long flags;
 
 	if ((HDCP_STATE_INACTIVE != hdcp_ctrl->hdcp_state) ||
@@ -1315,9 +1294,7 @@ void msm_hdmi_hdcp_on(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 
 	/* clear HDMI Encrypt */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val &= ~HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	hdcp_ctrl->auth_event = 0;
@@ -1330,7 +1307,6 @@ void msm_hdmi_hdcp_off(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 {
 	struct hdmi *hdmi = hdcp_ctrl->hdmi;
 	unsigned long flags;
-	u32 reg_val;
 
 	if ((HDCP_STATE_INACTIVE == hdcp_ctrl->hdcp_state) ||
 		(HDCP_STATE_NO_AKSV == hdcp_ctrl->hdcp_state)) {
@@ -1345,9 +1321,7 @@ void msm_hdmi_hdcp_off(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 	 * AN1_READY bits in HDMI_HDCP_LINK0_STATUS register
 	 */
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_HPD_CTRL);
-	reg_val &= ~HDMI_HPD_CTRL_ENABLE;
-	hdmi_write(hdmi, REG_HDMI_HPD_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_HPD_CTRL, HDMI_HPD_CTRL_ENABLE);
 
 	/*
 	 * Disable HDCP interrupts.
@@ -1375,14 +1349,11 @@ void msm_hdmi_hdcp_off(struct hdmi_hdcp_ctrl *hdcp_ctrl)
 	hdmi_write(hdmi, REG_HDMI_HDCP_CTRL, 0);
 
 	spin_lock_irqsave(&hdmi->reg_lock, flags);
-	reg_val = hdmi_read(hdmi, REG_HDMI_CTRL);
-	reg_val &= ~HDMI_CTRL_ENCRYPTED;
-	hdmi_write(hdmi, REG_HDMI_CTRL, reg_val);
+	hdmi_clear_bits(hdmi, REG_HDMI_CTRL, HDMI_CTRL_ENCRYPTED);
 
 	/* Enable HPD circuitry */
-	reg_val = hdmi_read(hdmi, REG_HDMI_HPD_CTRL);
-	reg_val |= HDMI_HPD_CTRL_ENABLE;
-	hdmi_write(hdmi, REG_HDMI_HPD_CTRL, reg_val);
+	hdmi_update_bits(hdmi, REG_HDMI_HPD_CTRL, HDMI_HPD_CTRL_ENABLE,
+			 HDMI_HPD_CTRL_ENABLE);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
 
 	hdcp_ctrl->hdcp_state = HDCP_STATE_INACTIVE;

-- 
2.53.0


