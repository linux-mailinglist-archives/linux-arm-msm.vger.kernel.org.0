Return-Path: <linux-arm-msm+bounces-116417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pkboIpIdSGr5mQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:37:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F151F70588E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 22:37:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="kwWcc/aQ";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Efw5geaU;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116417-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116417-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ABB13011F2D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 20:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBEC53546E9;
	Fri,  3 Jul 2026 20:36:05 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D269344D9B
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:36:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110965; cv=none; b=sT57OXlRmg1cvKjK6F3g05C2BcetSo28SVuACHK+DT/BdZygS6aOULVFLGg5U3q6kUWoDNsQ/3JejlB/E7hJrBVns64hbqR+SHp3hikGLaWsxgGCxYYJAjwTAL41XIcwQRJUBQjrh7NjfXWOO0EK3CKybn/gNyC3E5nEArkA7BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110965; c=relaxed/simple;
	bh=BghuoPAEZNaeJMJPKdJFsDVu1LM7cTUOvUNAAtZ7DPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XONQBx6hBb8agxIU/VVBeYmiMtu+85nlDRTGs2elz+eEG3QucJc1EqifeQBL7Kxz8ABS2rOZEIi0/PcG+27Krz94Gqmv8FlkH4XGJUWsx4QDINXttGP3mdPWobEliI/GOs0DzFnE0+XYYura4hHzpDt7fsNnSdjxHO/SZjvWQ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kwWcc/aQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Efw5geaU; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPSXL1019183
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 20:36:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=; b=kwWcc/aQsvDhuNvU
	sR7hpyO1eDnpBJVtmAbr9xTdsoTDV/umabqbahre0b6e4XNHuWEDLADYcmDPoIP5
	RVRpYv46JJcuv42nh/uIRPKVavgKEomucpLkYOCSstuaFiDolNL3MwQkgUCjNV1M
	Qe90JQBTQwnxVYPLP8yzo4Bw1UGjwwsWfb8jFqFKnLLGzoVAVbyTHxlAuBsbD7aA
	u/6rEvqbMjy+myKEK2uvwWQQ3FJC46T3e86XyArv/GU96C5rwAGjgJP2wF+sgEgE
	zc/24HIlzL3Oj92i18QWYdBgSptNqMIFYbW+1NEYBR0ZksdatmJ15lBv7JiFgbrB
	ol6OSQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ckj1ndr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:36:03 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so507616a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110962; x=1783715762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=Efw5geaUUI86pYogHsorR4OqM2ZndImnX4ZjdLO1XrmT0mt8SMNZcApUhfJ+xEpecK
         z8jXhZSKlW0AUZgHVbcV3VLKYpqYkd7hI6AIfPkxcN9oNLxfs1Tn+8DVrDNbBzKQAuy6
         nJl+f7lSq9HOgnnRjNXbvdQvgVtFx0zCMamga5kBbUnZIir7QIdGPiuTyV6FtlyUL3hi
         mM4rQOjF1qfg1cnzxzGo5GXgWWOC2VdodIlJYd6v+yCXD8/CUOqDAAPT8d+DQvrP8IzA
         o+hYobGbd/NHBITGaurWsaV3QCAY1nf61AQhgWFf3WCm9HSNUvmMMKCfe2iIsRfvxOFB
         gaZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110962; x=1783715762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YX0xffgjn0Hj0XJqfYesceM2iVvwVlQIavz3fGceyNQ=;
        b=pAhxqupkxrBxQi/n0ICFyQFUn9Eg9H+yW8VSDwPbJefFDSA0m+iyZcYt+BCQCQAb3j
         1aLsFAmbK3gHRyC0GQAai1p85gugblC/NPWPmk2yqBLT7XMPj6mvRNLZZtNt2nOeYMKK
         qEXzsyVec+GxwVsi40IcwqPMPblZFwuiUiYGx2Doz6CHq/kYIaXCAyreZo/V1nn1eQaD
         G6DYmW2HjlifnKPOqtv6QgcHQZAFmy5/NGEEUg79EoNxN35+0sji2NhskvNkQGgG6O2Y
         FrN9ylBFOCnbtnnFJ3xeZDQmaXrDWh0fOi4IWJGtSGEi0/Ox85zQnBvkxl2y2hcKgn9k
         X+4w==
X-Forwarded-Encrypted: i=1; AHgh+RraZgA/irA0Y9Ts9Bfv3anWYvenKc1FXKqFkEHN+8CxEUcDZp/Pwm9IXs+ktU6mlBSF9WiaZtPKNSYFQdqw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6b/22/tkFhgnIB8cBTrzPFLHCTcosGbncF2eSdCKo0hB2XPt4
	D9JJPM1nGMdrOiWNsbmBhsZqkO4ua0n3Qw4VAuTETJ/OFQ3lfPXikwzWZvK6U9RTEtpm+chjwfq
	u1vA+TlyodtnEAkpOdk6UY+L9bz8LCo2dcUXi+vkJ/Myse+xukH7ymrg0DtDPKWfNnZj9
X-Gm-Gg: AfdE7cn9VnrcesfoXmk2KwG09GSUOsl6Y8ChojF7SZHoWzw1p4a5iBKjIgkt0oUiKhH
	pI5GULP9NjqQ1IpwSA/MqBFindCuRqzuk7UITsVJGpgYr6U5ILqcgKsMHdH69Wm9W/EUbOcg77i
	MSozUucwgjZFIyqEaoo/4fxku6Lr8oGd1Pd9LL83G0gmrjHwWgWUy8h5k5MnMktZGRqezvKKUsU
	A730Ipsj+kNXFHJguOgq0f0dAIk2wYwq2Y4ZCyA7LwG/O5TgCm4FO9v2c4gMZdlmOnTbTFPVBiY
	s/26C0D6PZjj4OchLROgh1VxMVUFBA8k0m4GjY7jsxdvO77ZgmuItVG+jjgeshrRwktdBeO+C4J
	bXHF2L7FVsVPOEiEBd/m3rT2q/K5tRlXF5So=
X-Received: by 2002:a17:90b:57c8:b0:382:1cf1:a0a6 with SMTP id 98e67ed59e1d1-3829f5eadf7mr875875a91.24.1783110962222;
        Fri, 03 Jul 2026 13:36:02 -0700 (PDT)
X-Received: by 2002:a17:90b:57c8:b0:382:1cf1:a0a6 with SMTP id 98e67ed59e1d1-3829f5eadf7mr875826a91.24.1783110961759;
        Fri, 03 Jul 2026 13:36:01 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:36:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:31 +0530
Subject: [PATCH v4 5/9] arm64: dts: qcom: shikra: Add A704 GPU support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-5-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=3495;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=AFPL1mLXpKffrlVn7dhyAuVw3rCpzngGAE8+zg6xtsE=;
 b=ZlRr5sWqKb8250Ap/ksWBqpMq0V4lok4Fs/7+kMo7z64J193DYFwpD+3fTzxPU/vnV3Pvpcyi
 v/N3wBxCT//DPMPx7VhN1Xd25wRLqcduWT3dZQeV4ed2hEg3ZXl8MJg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXzYJd6a9b6yVt
 sFWh4Q2XH45XJVnYSuKXoOEauqvKMCItm6jAmyi3Rgw6aHQ5AZcfozfhbZdHjbLX2AaCe1YiNL4
 KPY3JmGimhD5mCP6SAdwpd73LWL07gI=
X-Authority-Analysis: v=2.4 cv=E8v9Y6dl c=1 sm=1 tr=0 ts=6a481d33 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jWRUczSHPS-Ra7sZ8p8A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: PeSZ6tGtDxS32mGyoTlB5CTFLer9izHs
X-Proofpoint-GUID: PeSZ6tGtDxS32mGyoTlB5CTFLer9izHs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXyl4QsPsVVTjP
 vJSYBzP1riiJCSsZ010Azx/XvTkFshcUzGNhO9XlMjpJhnztD37/152gG42UecGg6d240i/R/oi
 qwnZoFgZQKPdFHjd6yCjbsLhcgQK95Mp8nM1NSmjIEUPXWREqvq/v+u6KxN80Qu8M9Jb0ptwJef
 qbbJvHgfGZRWiTCBqA88QKXNliNYE3ypmxHB+nZmTgaiYbWtx5AC/vyBR5gyrrwpoINP4+kprzh
 omZDnQh72izY0nIgW3moDoCJkoSkjAw0Se85IenIc6Mk4g6LTlD4tCm8/yQfD3JK+83VCtr8bXT
 JhLEWYRptOYk7qDV1SJVIX1UMQN5kATd8NGcTL/9gb+GglULzTJscsj7plZlteHI/J3HM5sHAKZ
 UfJaqT/sy8CDGTxq5vfKbTxjmzJYoIbF4vbnJ/YU7SSB9Z8DLzzv77YEwyql1QR0wAP16tW6MgY
 cX19rqAOih+AS6pXGlg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208
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
	TAGGED_FROM(0.00)[bounces-116417-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:asherawa@qti.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: F151F70588E

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


