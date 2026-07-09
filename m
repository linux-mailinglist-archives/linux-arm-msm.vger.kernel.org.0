Return-Path: <linux-arm-msm+bounces-118088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AVYQEbXuT2pzqgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:55:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA667349D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 20:55:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Yr64cHKx;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SFqEE4Qj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118088-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118088-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C4ADD3130E05
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 18:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F3443B3D9;
	Thu,  9 Jul 2026 18:43:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B4643B3CE
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 18:43:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783622594; cv=none; b=Z3qoaVfIweCg2undylM+Zuo4yWdCqCiYaWmme5VG4lmVMEXMWK+8nuj0VJY+gQAsL3Z5Gs8fCxUr4fYuNdd0ypW59stssfUYM8Y0VjEnbiJjkinaDO1empLqKo0ZOxrzCtCWHUX5q7c4p6aB/Zz9MBBCqYcp7YyZ1MnejPfsb6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783622594; c=relaxed/simple;
	bh=BghuoPAEZNaeJMJPKdJFsDVu1LM7cTUOvUNAAtZ7DPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DDbRGlrpW37BmNyz/A0+RFv3z7r94fRJQOZ1JAa3zv+VkcFKKP4WISe7Nk1gDxYXq2JzE2LsI3K12Q6BQMj7BSNyfDQEUfA2+FJzqeD6UhvyfpEdCJ7QcokT3bEzihCc2GIm+Xyfn1dMqVT01Qu/TL28Wq1PRf0LVdxXwS9PfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yr64cHKx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFqEE4Qj; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HYwPo2520401
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 18:43:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=Yr64cHKx2hYIcvXe
	23qMLVYQYQjimgeW56vjD2MNs3ZzA8c2CBI8GfDJhERElGzyCBvkOMB1h7wK1Ydx
	AMjl5K4t1loPPLIWggmRW6d+ZMsz1M/pH87YN4nX6YjIoQETLejy3YLdK3eN9bhH
	QA6ZIBnYhld8ocJ+bTjhZpS2KhQ26xVmhRk+yw2weltV8Z/++RofZkaVNAwzB2eQ
	BquSxmo67+ChX5W8gQvc0SWRzGhn1GnjncLx2DlY37Fvwm7R4uJz1XszME1yvMOW
	ZI00+PqI+jIGcuEo/oVw6vZexs0PM66Snyv6aGdWHdoefkyQ6rHbXtcMtAF45dUS
	z0xWdg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faeesrx1a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 18:43:11 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38127ae6b99so205265a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 11:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783622591; x=1784227391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=SFqEE4QjVkzKEMWJuHxzDeBPxg18Lh+i4vbINM9rO7wGXrEo+CTiPsm0m9xGdfrUZb
         L2c8LrEVkXZ+IRVg6ihKQvO4eyexduLmfHtspq+3jttnds14Rdfr+4F2/TyNXYAugwWZ
         4HRDwSJDoO2N3M03xYPXJJDefAlltxfjIjBcKXqG8P6zlpUZTrbXI93QYJGg9nD6ZQb8
         JYW0vvgrZR419DuJq1b42KGNXsMnuK2SvRiYZx+X8ozgvzmt0iYIH4u5U8uiwsunRiYl
         PJy8zElRZKtbGZHj24V4Xk+0+zlcfqTZ4AqSBWsfs64mlKNp8QZSAuDpiKVkj2sczGwF
         sQUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783622591; x=1784227391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=OTBNIZETheOY7Otg633yV0AxwKrMxTjeayxvubzKrXqMe5fgRLsWiGTVM/yDQPE90Z
         d0rz5j8MtuLKgOhVFliuRA66LYG/UCLMwVr1elxPpwIGYeKLpAT7OIUJRbIkDmZK1kgo
         If7mUHYB2bvamHxYfbO+Hy5LoLtSdN1A+v7AhlxdqkkBD15FaKJOTAJBdQypcEtu0BTL
         RBjIXvQkI/yWJcFVaWnGC64Ov636bp5JRJFEinWq4xz4Aa1764tjguio/iOeziuQEteH
         pZhs82/Uh6SX29RHn45NT4oG4CuBX6KVjbYtagXS5ly756bSIAipwkTyiaJ3bv8a0e5c
         xtSQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOYAONMpSUT95offV06yOz8OwtkzVz2FNGt5kmsrePmi+iH9XqXTViK6VdYPGVwsUi5xgKcR5I4QLMnr/G@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4GN1/yKb+c4Rt73Ozi1kVKI39cvnhDKTEY5dbBcn3pjJqTxy
	eSBRAXlyH9ltD44nfrSdETjiZtkwVNrvsf362FZS3YqtUMyneD2Tg2tcIpjAvHxfSuoNTYwjBc1
	4S3ixataAqL46UZKBjNiYP8s2TX6AduXRmI82vhOW1Ko7+yQHVDgrrUDfFieeVFQxojyc
X-Gm-Gg: AfdE7clXQzBcIbpy/iKkaEKw74ZGYxL7cOIvVVJD9crWHb1aTuZrUAUpsqUaBMtrGCm
	ocjzT7ikm8TUAbf8dkcZfjE102QsOOj+fByP1mWsQaP9BB8ddnOUUTBPXYtYdvFgetnqvbpT7OC
	jimefZqWc5dXXuvg133n2xg1fXVwxG40xigfTiI7ud6IeWP5YGRgE/FFoQl7hlqqBJMbFDO6al/
	i84f0LCAivIm5OG2P4tBjUCpRlVvDW5fhMrBxZwwEHsRMr8kh5QIlhVEO8PPT0tfrTXegerjx73
	i1Y4RX2qB+9WuP7YtDIbpW6TsBpsurQZeZvAtEbV1j9jbnPp0W9sb5dv3d6NI/B9BcnrfHJJI6A
	BFpYWsKVqYbX05+O7yFCVy/bHgYF+uAQ7F+Y=
X-Received: by 2002:a17:90b:562b:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38d1596cd89mr399551a91.16.1783622590623;
        Thu, 09 Jul 2026 11:43:10 -0700 (PDT)
X-Received: by 2002:a17:90b:562b:b0:37f:a913:1554 with SMTP id 98e67ed59e1d1-38d1596cd89mr399511a91.16.1783622590143;
        Thu, 09 Jul 2026 11:43:10 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a56848sm34205652eec.16.2026.07.09.11.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 11:43:09 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 00:12:04 +0530
Subject: [PATCH v6 5/7] arm64: dts: qcom: shikra: Add A704 GPU support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-shikra-gpu-v6-5-b388ec5dce77@oss.qualcomm.com>
References: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
In-Reply-To: <20260710-shikra-gpu-v6-0-b388ec5dce77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783622535; l=3495;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AFPL1mLXpKffrlVn7dhyAuVw3rCpzngGAE8+zg6xtsE=;
 b=tacrVztp9Jm3lWTvjjWw+Fn25POssjiE+J5DI8nPBE5GAX4Ro4DXa/HhntJJc+zyCEmRfs1LQ
 PKX6hvgevKVAd+LXbcTmBLwciCfuu6XNqjkJwaY5W0UAJFZrhFyYmNK
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: XA_eyYFiJ6NP3UD-H4XsDu-AOgISMRYs
X-Authority-Analysis: v=2.4 cv=bbpbluPB c=1 sm=1 tr=0 ts=6a4febbf cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX97ujQXWLc0c6
 TSElvlajUvEg9S3KG1QyK1mG9AL4OvOh8jan2yneNe1mzajCu0DrvpdnoEU742fIA2sPf4oo1mT
 zAYvk9f6HyoA1h1poBd8igv0maupKWQ=
X-Proofpoint-ORIG-GUID: XA_eyYFiJ6NP3UD-H4XsDu-AOgISMRYs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDE4NSBTYWx0ZWRfX5tAz73Gkwk+O
 5PmR5KhbZlveHZX5iQifC5lB8uBbWLmbDUznhK9/Uv9qYMtTz7IGYIXPbk/sbstjB51PkJbpusq
 OUe1UM7ls4VD5rMX5eKoIKaMZmNcOH0h5MOUTSyIMZbAF5NTcdaXeLqR566cfNXHsWLRn/VyxR3
 Vk6MKJnfHWwAJLNmA+7zsNwBzzNrULDLaSzNUWMsruUDfSl0VRBKluEqTgev1DnTkgu7rBdLgWn
 AfaNwNDW2n75hCB8H2jrglNd83P0tfe4hDhiBBQ+deBJD26NFm0ThvyOmGQgFl+j8xKoTqQMNHj
 6QZ67UvNFyDux8w/cx6HG/MEJ/MkqqFIcMUzpK4e+rMXylKrUHR7zbwIF3nfmP12HASyzHu6eTw
 tHHtGRwJvsQDGtFvJl0cbNaPPx2R9edltE8ud6z28C/y3U7VxXAX3aVj4cHiobYURrb7DXOdV0w
 0B1ZVK9KHefa7PuVS/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090185
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118088-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABA667349D3

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Add the A704 GPU and GMU wrapper nodes with register maps, clocks,
interconnects, IOMMU, OPP table and the zap-shader region.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 98 ++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index bb11e832d9a6..34261221664b 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1992,6 +1992,104 @@ glink-edge {
 			};
 		};
 
+		gpu: gpu@5900000 {
+			compatible = "qcom,adreno-07000400", "qcom,adreno";
+			reg = <0x0 0x05900000 0x0 0x40000>,
+			      <0x0 0x0599e000 0x0 0x1000>,
+			      <0x0 0x05961000 0x0 0x800>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem",
+				    "cx_dbgc";
+
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_GX_GFX3D_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>;
+			clock-names = "core",
+				      "iface",
+				      "mem_iface",
+				      "alt_mem_iface",
+				      "gmu",
+				      "xo";
+
+			interconnects = <&mem_noc MASTER_GRAPHICS_3D RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+			interconnect-names = "gfx-mem";
+
+			iommus = <&adreno_smmu 0 1>;
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			qcom,gmu = <&gmu_wrapper>;
+
+			#cooling-cells = <2>;
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_micro_code_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-1142400000 {
+					opp-hz = /bits/ 64 <1142400000>;
+					required-opps = <&rpmpd_opp_turbo_plus>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-1017600000 {
+					opp-hz = /bits/ 64 <1017600000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					opp-peak-kBps = <8171875>;
+				};
+
+				opp-921600000 {
+					opp-hz = /bits/ 64 <921600000>;
+					required-opps = <&rpmpd_opp_nom_plus>;
+					opp-peak-kBps = <7046875>;
+				};
+
+				opp-844800000 {
+					opp-hz = /bits/ 64 <844800000>;
+					required-opps = <&rpmpd_opp_nom>;
+					opp-peak-kBps = <6074218>;
+				};
+
+				opp-672000000 {
+					opp-hz = /bits/ 64 <672000000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+					opp-peak-kBps = <5285156>;
+				};
+
+				opp-537600000 {
+					opp-hz = /bits/ 64 <537600000>;
+					required-opps = <&rpmpd_opp_svs>;
+					opp-peak-kBps = <3972656>;
+				};
+
+				opp-355200000 {
+					opp-hz = /bits/ 64 <355200000>;
+					required-opps = <&rpmpd_opp_low_svs>;
+					opp-peak-kBps = <2136718>;
+				};
+			};
+		};
+
+		gmu_wrapper: gmu@596a000 {
+			compatible = "qcom,adreno-gmu-wrapper";
+			reg = <0x0 0x0596a000 0x0 0x30000>;
+			reg-names = "gmu";
+			power-domains = <&gpucc GPU_CX_GDSC>,
+					<&gpucc GPU_GX_GDSC>;
+			power-domain-names = "cx",
+					     "gx";
+		};
+
 		gpucc: clock-controller@5990000 {
 			compatible = "qcom,shikra-gpucc";
 			reg = <0x0 0x05990000 0x0 0x9000>;

-- 
2.54.0


