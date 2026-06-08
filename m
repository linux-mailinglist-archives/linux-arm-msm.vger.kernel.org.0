Return-Path: <linux-arm-msm+bounces-111915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tygIASDSJmphlAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:30:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id ED09F657349
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 16:30:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=k3N1gQtS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gnEc0q/E";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111915-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111915-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D7890301C9CD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 14:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC2122F39B4;
	Mon,  8 Jun 2026 14:19:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E2C3C583B
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 14:19:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928388; cv=none; b=l3G64wXGXomx+/fX0HiV69M9J7aeJuhqYIxunHJzsVfIkLvsjfSfXdDnd4BD/qkiwgr80EfKEeYih7gYD0dr2wcUQMYmfTPw7Gtrn1eiXI6JFJA5so7ZALtJ4l8Lm1zOyuGX2uKTA0hjTl/0xtwC6couWWwN4zxbLSiZ3jAJ5RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928388; c=relaxed/simple;
	bh=RCYy0IHiJIJ71s+W/69dtSzgpRWYhBpmknflCMoSQ7s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aQ9YjBYrAkmFATaOissH9E5Jq8+GpirGLZfd/zwWYJUik4GakhRpefJLUrSuib7eQzazFq3yS4Zf1fs7zs55ObPA6JEzqoKm1EfVChrj1OifbR5hycUP4piH4uP9m6ZAZjtpAgbTGGYhpdc0FSWveabBMegt0MZHHibrLYJKl+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k3N1gQtS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnEc0q/E; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658DRb8M3759470
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 14:19:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T48n2DUWsXNrk3FetI/dF/Eg9NT15exAWsHm/kM8tw8=; b=k3N1gQtSk6OnTdvm
	E3Xfi5uS1MXoIMj1wX3SgYwWlu2h1JuCd+0V7Om7+xRUpC1p5VZWoc70uaaLLQ1S
	dOSrfCWM/Ut+fDoDbd3fn6KLk7Covdz4ClO11shd6Dsq4rkzC31YIIs3qfo/zBWT
	scbGj8S+apvyyujS5UuhcIsvHZgDKE5iMS74v4LwZfujaAxw36lOhG+iOWd28buv
	utg13w5p2vIF4YRQ211eQuAo6639MX+DkrqiASUKtzQnXgUGdga2fJQi4q/exhCF
	MoRn0NNBTon5GdL16F+/99WYZLbxs8eE7GEoKiy3CW07kBIwr4G4K3CqKcjZpj7Q
	FIKssw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4entr0hdb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:19:46 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59eba8fe530so6846829e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780928386; x=1781533186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T48n2DUWsXNrk3FetI/dF/Eg9NT15exAWsHm/kM8tw8=;
        b=gnEc0q/EJ+1Vp/L2aJ2iXTHxsf0d97IYT5cqjLy2WUZScMkwpBSXj2YqBrBjSmYPPq
         4SB2PBp0u1RIryn7GRROYMNB+FKpra+WJtpXu/iZQfs+fZhX3mYegR6qj2gk8551aI9c
         a8AgYIryQZlmvxq98poTZktBmWhT/JJDWUCHlUpH85iwTxIwcTXmHAxVOp6FLZjQebad
         MCVfktJW9W1thWqT04cGo7X1eQuNSD2Fx4HSRSE6ja6+W2YGn5ZXHADQaL5ZU4yVL7yT
         xk0ignjxlGjWkxjpr7DWGBASksk3MQ5b2jgF8DLN05PPkndqhNYGIDyszmBMB2WK1YbS
         5iiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928386; x=1781533186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T48n2DUWsXNrk3FetI/dF/Eg9NT15exAWsHm/kM8tw8=;
        b=jXjZPNfS8+ic8CSlJaiRg1BzaWgDh3L802IHl299FFVGgc/RqoIoX5p53s9i8q+a1y
         Z7/C8njRHAIugeKeMpkeaIU8rIljkwlb4zaupIIpDdVN6MJltZgD5gO5H0oWov6HWZF6
         irDEAVaJ/szhZHUqsXagYVXO4hraPBH0Jiq+7ETk1Cq+Lugl21mMXC49KCBB2HybaeN8
         X3PMQKYF67xMIAU0dt+hE9Sw3kvyjUoZXFK25Rl1rz2yDOLybDrwdzEag5sUgr9W1XDp
         Tnxy8l7xcOEcgYB7jNydRirRD+MoFNDz2cr7/O7wxNPg78eLgWPGHizTUwNcTn+tE35p
         6m9A==
X-Forwarded-Encrypted: i=1; AFNElJ9pwF+Y57urfCULsDiPFzNCR5CpxjRdg+hT3shMlrq7PLnJR24yn4GMV/9tDGXw6TxKus1N4EU91QYKPLMK@vger.kernel.org
X-Gm-Message-State: AOJu0YzaSMVKHZ9nuOL2DawiYgVfsovoBFgY8GuTqH/KKJ9pth1qY/XN
	XSTZ1YLog6ioeiLigwwFUk4QeBIBI4bzHM8u9iqX1gJODFf1yzO85x81VZtUv3uBsNEIOOsUtxs
	CnWFMcYlrVXrYDQ2PlBB9s1WMsReo0j7CSIOSo8Rl7LyekCqW/ZmkZUb04SI0C163LN0/vVhwFy
	a0YHk=
X-Gm-Gg: Acq92OET1+eq0h+l630BbTaXOo8PxmjDyXtZ/uGcfvUOePXxU2B1uNryyh/JQ0xOHdk
	yOJEKVKGVMzjGv0oedWbYbT8LKA/gjDNW1Ehroxz77jRmwTEoiY4/3pg5ctOQV3EiI8HeMUL0wP
	wijv/7p1ar4Dgxh0KOO989BEwvqwOqNjJxA+E7Tf+4j8HByK3rnYwqauqNGyvA86VR2AJC2Z3gg
	rQkTxuaUiS/XQZXhXYA7bnidQmSlsD6SvzdIsZVnrS66widI3rYm5tZcjCX1fAPYMJMNiaxPi05
	0S/biwVm/RIwTnRxiRwQuuPgNbf9GC13/663/DUdU8Q3zsREojx9r+LYCPumHZYNH+entSkAzbc
	/QPSSqC3pRCQ0pK3RKWPNoIRuGL3HprarHcho36RvngTRh+1HLuem32qItnI=
X-Received: by 2002:a05:6122:1796:b0:5a0:c38e:6199 with SMTP id 71dfb90a1353d-5ac4ca5ce4amr7610846e0c.1.1780928385955;
        Mon, 08 Jun 2026 07:19:45 -0700 (PDT)
X-Received: by 2002:a05:6122:1796:b0:5a0:c38e:6199 with SMTP id 71dfb90a1353d-5ac4ca5ce4amr7610799e0c.1.1780928385554;
        Mon, 08 Jun 2026 07:19:45 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4904:8660:26f:8b6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c15cesm397599425e9.5.2026.06.08.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:19:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wei Deng <wei.deng@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: Re: (subset) [PATCH 0/2] Enable WCN6855 Bluetooth on lemans-evk via PCIe M.2 Key E connector
Date: Mon,  8 Jun 2026 16:19:42 +0200
Message-ID: <178092837981.163118.4463258851423326572.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEzNiBTYWx0ZWRfX9LaF6Pd8EAe/
 /S/aa2kO98dssD8GlpFpZFy/aiBATUG69VHkZ/HVhQizfoaFzVrzYUiqcTBc70/6EKsH5hZSIDL
 NLD7UYPJvkk3zt2LaZ5Q80XLOp+Zr4bmmun+H6P+3CvEw+/wVyesZxzvjUUOd5wlp5gNzT47JqI
 q5e3kuUCD2MpnB1CMI8RhlQz8HdcmY3q8Sz6CkQLVOrxnF4bMCmNmOE3iSEHPI6LHQE/d1MNQFw
 c7YzlbcRM9AphpXzauxJzwsah3PlRqgTuXS3aw9JNjZvF0wsNfkwxTlKTk/x2B3zL6Pq/4G3hJ7
 u+OWdhIcitsVqwIQhBXZMXplR8yKeKzViZU9Y9fgFewmFc7S+WpKLXbwi1we+w1uLTBpasfw24J
 wVSakqDJeksKdts4vbBDrufW7a4cJqqJ6/AksKqN+LJsbpMP8bsuK3Je/ri/3m7Petb6Yy/mJad
 TnlXUXsma4UuFIIEUCg==
X-Proofpoint-ORIG-GUID: 1NSnDarPc6SkPhumwUnokcejnnb9npzs
X-Proofpoint-GUID: 1NSnDarPc6SkPhumwUnokcejnnb9npzs
X-Authority-Analysis: v=2.4 cv=VowTxe2n c=1 sm=1 tr=0 ts=6a26cf82 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KxFyB6w1bcBEixo3GQYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606080136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111915-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:wei.deng@oss.qualcomm.com,m:bartosz.golaszewski@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:quic_chezhou@quicinc.com,m:cheng.jiang@oss.qualcomm.com,m:shuai.zhang@oss.qualcomm.com,m:jinwang.li@oss.qualcomm.com,m:xiuzhuo.shang@oss.qualcomm.com,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ED09F657349


On Mon, 08 Jun 2026 14:47:00 +0530, Wei Deng wrote:
> This series enables WCN6855 Bluetooth on the lemans EVK through the
> PCIe M.2 Key E connector + pwrseq-pcie-m2 path.
> 
> It depends on the "Fixes/improvements for the PCI M.2 power sequencing
> driver" series (V3):
> 
>   https://lore.kernel.org/r/20260519-pwrseq-m2-bt-v3-0-b39dc2ae3966@oss.qualcomm.com
> 
> [...]

Applied, thanks!

[1/2] power: sequencing: pcie-m2: Add PCI ID 0x1103 for WCN6855 Bluetooth
      https://git.kernel.org/brgl/c/bde2202a2fffd3137df9a0b4b8ffd8a44ef316f6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

