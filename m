Return-Path: <linux-arm-msm+bounces-95025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAPXLqwGpmkzJAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 22:52:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2F1E434A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 22:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CAD9F325A177
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 21:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60692387355;
	Mon,  2 Mar 2026 21:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5EcI/BT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMhbC/b/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34552386C3A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 21:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772485656; cv=none; b=B5ppItNloCsOWzteMWKovy88VhsJ5yXWfYZ3rIFIVUDx1eagI4tglZOLiKczuB0bBEgJOG+kRaL0k0HddDI9bG8WxdIe7y6zhh7hNIexrKJ46QClMalSUOP3AVaPP0Jl3Wl6h45UtF7YqF/8tzfdZybv6yH/44iQihtOKrewPvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772485656; c=relaxed/simple;
	bh=m1lhH0Mp/H6A3WsuB5Z10uTPvOT18mKoSJAgm/WgWs0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=KKdfsn7tYuv/Q5QYLzsQfb9c7/UgxmZ9EGuxbFHuJGepcLNMCwU+OIQSkgng3k+3zWOVBVbD7zXW5FsQIYg7yoIE9D0SmflkZSrMKoAKkAN+ZsX1w90ngnSEuC1cOz3of7Xf0vp4r1s7hN5pBtp4oadcmbs1rZGThPnJEnYEUH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5EcI/BT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMhbC/b/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622Jw7ip2504642
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 21:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5ZXj5N9aNqZSxL/OBjXVW7EXYIkiLOUpceEWatfCSU=; b=d5EcI/BT/ugSeRrQ
	2XXHqptkmBktwhuoxBS25du/EJTj1FqZjvbOSZZhYkJBiQVq37e3BOh24TYXq8tJ
	WNSQOlkpmAHd0xkqoOR3ycTXflREKHT60/fKzucRdETPhS9xLAYHuvEYhlGPB944
	iB8GGuniCW/11FMUNc2OW7ZnbR/xkL+fuWGIEN51osQ0IwZ3z2N63Cr3qEwpcdDv
	WASVlQK0ON4ikp7a97lc9iRvnDgE7/LocpbAhY4OKCYCAafu1upiC00ps/bAXy6Y
	TU0PzAcImodyxlh6p9n4ZhNwhFq4hNyo0eXJRcJrn+9BxAwA4DcluZgY9754s0ti
	/vIjyQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hety4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 21:07:34 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7d49709f87aso60364005a34.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 13:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772485654; x=1773090454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C5ZXj5N9aNqZSxL/OBjXVW7EXYIkiLOUpceEWatfCSU=;
        b=UMhbC/b/Pfxwd4qPV4B/yb9BLi5T1JN8G5WVm4HxW2LT/7jlBmBW+cqjCOZED3P5fL
         EC1lvEk2cx3L4xfu/hJfyLH4vHnfpTBR6DqcaEJFP+Jkly+5YL56eI1IJXaDNgvZIS+u
         iUiXuDUAWsUH/PAUUzrrL4vIeTlaAqqQtkosBYUxMSZptcpHf35RfPppXJSLlHmNXgMC
         DLZJzK+jGDnegNulURvSFeocUWVP6S21hhtc+wF9DRdjxCQSjsfrzDuvWuBRzdvBxNiC
         hCp++0xCle49c6XptlXZ47q0FjFbE4i2nxQG+ZGmnvRnNa7pfASjdFBaB5BdO6QM8uJa
         Le7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772485654; x=1773090454;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C5ZXj5N9aNqZSxL/OBjXVW7EXYIkiLOUpceEWatfCSU=;
        b=POLTCK3sZKpqM6+KCposQWkTOw5PJI6MI+YpZU2eWvR5Ai3fYsDR/36Mh0rS5TJx3a
         of4mu08ugFSESq0VArPaDNZoWSgmeP2Yqj57XlJnwfZkvONrbVXEzZHmlStQsPJSRRFh
         Uuql3tBJ2aehBBy63I9oqNzSa701fklpJyPpf48ZPhVg3maOsDv6NKQ7tOvZWkWuVGt8
         OC2pktdMsI/8tTHZGOSlsb1TZMYH7KeQrfp8zq7LrwmwRF46J/D/ST0ogHoQSCmK4o5/
         409jdKWoSkZ6DVYTaJbjSHPcY9CulwgtXdDh0r7pLNWudT9bnLjKdUBjEmk+i4lNfybM
         6jwQ==
X-Gm-Message-State: AOJu0YwLrc1qux831F3w5hxxFfs4GX3tgUDiLkxwm2tPMc+iRlhrRfA8
	gjOfhCV0BLAhUHrfShiAKOtLisMVB6RPWLNx77KhSTqZL+ixZl0FHMKlMFwLBoAFZ4hCctMwCZi
	I9Q04k2xYxn2RXxS3ZHNzH2dUWhBnEXXPgUI3ApgjjZnEknYzPSJGIPJ8aunye7x0OK9Fmsys2O
	iJ
X-Gm-Gg: ATEYQzwCNRS5mZZWFD9wvHumgwj0OumVTdtKwE8HDtlnZTKD9XpvqfP+O5BSifAa3sA
	jC7uTZ8t55XDHeu0DjdlZmDPygri7tlSwHSS/bDH9jiuiOyYdbpInx5YMdaFCkv3Em5xIkrb7kg
	RgaLlJ2Aft5PUiwmYs2FWjj6bY4ipFbU08Qwi49fx7dBfk83vqyGubuYar9WHPDVlVom2iA8VWF
	ckjFp1nlyzxDFxjvbBxQ89n49GELTa+ZArhwgar+XNDnYbvmjG9CJDC32yYVMjJydFytp/eqZXg
	/WgL8Z8HQ0q0FmosfaIdyRKTy9YvybkNA1nVcUxszk1nu+GXLcj9Jmk+aHFQtYzuRMbSwHHbLPk
	Y7hkT0dgU+FuSQASnyRvfWrF6l570p6xrr7m/jg7g/N19Ux2AJ/C62iEAxMKucCuTFrcDi+EKxv
	3g
X-Received: by 2002:a05:6830:3786:b0:7cf:e32f:de72 with SMTP id 46e09a7af769-7d591b3e1demr9634969a34.6.1772485653686;
        Mon, 02 Mar 2026 13:07:33 -0800 (PST)
X-Received: by 2002:a05:6830:3786:b0:7cf:e32f:de72 with SMTP id 46e09a7af769-7d591b3e1demr9634957a34.6.1772485653365;
        Mon, 02 Mar 2026 13:07:33 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d5998bc31asm7449967a34.23.2026.03.02.13.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 13:07:32 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
References: <20260212-ath11k-silence-probe-deferr-v1-1-b8a49bb3c332@oss.qualcomm.com>
Subject: Re: [PATCH] wifi: ath11k: Silence remoteproc probe deferral prints
Message-Id: <177248565242.1002715.10369057286186394328.b4-ty@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 13:07:32 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a5fc16 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6yIOY4caXks06VLbqCEA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: MH7wV8inacdYs7ISN1NmxA5y_ubJjb-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDE2MCBTYWx0ZWRfXyKXTeaD3ySQ7
 a47J85LPQNc5qQdVqCW+s4uRbqixLzZmyJm0xnv3bbm2vJVTnnzd4TF24qaW/O7k7vknfbmALr7
 6ZXs7j2IYJiKdzSeBuaNSb7+74kgMzAfGQGVu+14Sn+730E4iE0ZgWA98zbl9MY16SUioajoPEw
 cAOPCfueM863hon0n3WWJMQoLJWQ/ijLUqegg2Hp5SFiXth2Yp9Od/H/D68oOcCn9cIZ5roRSBP
 uChNOieHV+Bb3K90txRjcgq7bLi0tJEAV24iVNlW4xbj7CtihCcMu/CgeQAo0hpPM3kOzaRd3m/
 ddSGu045YXw/IF1Lk6LRx2MdkanLU7t8M0C/zb+9vXGe+8kLVC9Qhzd0yWwOiLW6cUyD6oBJU45
 ijqZu+UkViZQjZk9QrbJsm6mrRZ1yqyql6LqTbkddEra0ojI3su8CPkhhn9VhzuNZUdBRXHd+yp
 DDBMA8+cPbLC1GHradg==
X-Proofpoint-ORIG-GUID: MH7wV8inacdYs7ISN1NmxA5y_ubJjb-K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020160
X-Rspamd-Queue-Id: 35F2F1E434A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-95025-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.johnson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On Thu, 12 Feb 2026 08:52:52 -0600, Bjorn Andersson wrote:
> Upon failing to resolve the remoteproc phandle one ath11k_dbg() and one
> ath11k_err() is used to tell the user about the (presumably) temporary
> failure.
> 
> Reduce the log spam by removing the duplicate print and switching to
> dev_err_probe(), in line with how ath12k handles this error.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Silence remoteproc probe deferral prints
      commit: 6508c9752451a7e5e44a325e8563897a67f5344b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


