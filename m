Return-Path: <linux-arm-msm+bounces-114797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id r69/LBxnQWpDpgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:25:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 291736D4A3C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 20:25:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Zg8G6Q8u;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dBdPIMz8;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114797-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114797-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4998430156C0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2026 18:25:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1579C309EE7;
	Sun, 28 Jun 2026 18:25:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5982E03EA
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782671100; cv=none; b=oV5/yWdFfTG58rn8yIO1Wih1SGf2VzniIFIRTAO6McEau5xF0Fa8vb2Z+pukPzgNLsqAZ/BKcOFbys3eq/BHiQ3ifIT17QjKdu/0etjaFS7IAOS0TBti9kap3SDDJMN7bU05U05+bOeKfppjoqVl/E7N1QTqi81RZmgP28dV4m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782671100; c=relaxed/simple;
	bh=1o26QioJ+NgDK7fmYrSsNAyclYExqimllpZCk7ntDfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bEoEFtM9zjpDxebsQGDgLK9HEJxm+BBHmgHHAQqH4DfReUeOgEcDZeg02IhRE9CWBJ4Um2W0l785Yhmy7UCSuNykM1PKQzxP2L1RTD2lMP6BABSc3yFht0G+G40hRxfV3xS3VvCyBQcBdAL7HOPdH1apHRnAjwretQRx+a9+934=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zg8G6Q8u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBdPIMz8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHj3bU440861
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=; b=Zg8G6Q8uUhjfLb0o
	vSZ9rn1P2sClR3oBYHSJinWJLHh2+8T/RztbOSNnC2SP9lPyxeLZ4MNt4qxvvEjL
	EP7+gwI5auQ8Pb9RIebe5+pxKFrIfaN7s1PR62XM4DW5MPuBQy/MGkCvRtHEHbpv
	4WBY0SXRDlgDMzdIHUctpX2Cophcr/VSKzTihjpfb7/OFZ/RtXTEK6/0BKnEPWGb
	FKi4xsVDVy0pVXtlgrgMHKhh1EQ12Gp7XH3In3b+6X51t5k5pIxpCRd3TvUK4U0B
	p2qeg+y6Frqsevq7Voxl2i6UQVUsHU5+jjbbTxSItKbCJdN8g/yOr7R4pZPRzQOT
	BZbSjg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f270a3ecf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 18:24:58 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so10802385c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 11:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671097; x=1783275897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=;
        b=dBdPIMz8cSFHuDUa9oGG0PPbmkWLB6P25ieCjc9ha+7QvVLwcsTZK8/8OnYiUUzzDa
         AL7NV/qeR3T8USgRCuTOw/Vj+myHZeeSXjkyAScofwLMOVZicDleAowYkmlc1wbg/xrk
         D5K948WTsdif3yjf8rs6OoRTyYGayntlVrWVavsvSJ3Xo2oxMyS4khMPny3VWL6WOG09
         BRdqasEfH1YKqnMpaymatJhAumKwX7j5CY3ZPKsZrvDClr2/DZsXHDTag6fYXZBrFSBS
         ofedgFFowxZhdn9+/v9gctRLefA4hnOU3YDomgAM92XXdREAua+ZEmUG9Dd1OQ78/Shm
         SoYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671097; x=1783275897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IbMc4RrsOe+03o+lMwLAkg8XuHYRC2BTwKASC1wJIhk=;
        b=X1ra960J4Wlx5odu5Zaz7nJLvNjlhPmlw0yBT3BiMecdlzKhRxsqHtTcHBqSuN1/ho
         cvGRANratXu+tvFJ0NKTlARnKXZHUj55TwJ5oGlix0sxieX17a1ch+e4yX7Odq4WjcC1
         Y4sGx9JM7fpEttF1wLgKYmoqzN80rUlR0B166+fYv7KSV27rt/pDkGUKwkOipdnf6U2+
         arHWZ1jBFmX+/lGzoJaIC00Yvc/ZNi8/ru3Cp/HEiSRRSbhgy7vpvTbDEls6uQ/Ze5Sf
         OoTUxzD/uLWyChkt58uBAyfxwpMX9cnQfax+m9gyWUy4+sf9YrSeAvUxH/bzSvRQ/jDY
         jCYA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2eTbvJNWSzGHVmnJw0XR5UhBYh/t1R7lkVNiTXvgr4+y7/UxC18meurNyTtyfik/pMOHTxoz2vgjMgun1@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqn6bzpUJbSq7c1G7hmmdZXmaLp7abVCNL40qDSEybHZzw9DvE
	9bu/uNCacs5zaBTUyahleIUpO/OT5jo1UikpbPDWMxduLCqo7CmA/FWGSV1+68FdZ0M3bGj3OAG
	ghgdN6qZgF5yQlVh2jFubbyi2BROQpHVweNNwx72znItVPXqZK6eym4+aF8JD+2NM0CKi
X-Gm-Gg: AfdE7cnULAG4OsaLsLGGMsBAUaeMSZTI+9JZP1uH0w0fcAAPcKf8N3Bp49EfjWZ6Gha
	vzBM9FzUHSOm01fR0AvG7I1Dwoa8YvhWkrgl7tTCORnmTcXBt8ttpdsmwLwSbmhxAdtbzXgiCfD
	R4UGTPSMZcF1t+xoDnzpK7MSQYovD3073wX8WTbL8Q8hy9aVXxI/ZpLYa8ZttUjO4vvYBRf7cc3
	CCyFfqw/T1+JP56rDjB5X1fduj7I3+FE4HYHK98kMBMvDVfFBOeZRnTBYQgz3GkCXV44eAHVpYJ
	d82VjfhJqyp9kJMF+QGaFQ6lKUkQ/RiC7f2G+tZY8rIdSZ8ncv5HalrEx8J6jk4I//ww7w0hgpq
	YDYwl03d0msRxbztdPhLcgPbT9BYCliYpBSs=
X-Received: by 2002:a05:7300:5bac:b0:30c:1b22:646b with SMTP id 5a478bee46e88-30c84dad33fmr14207323eec.19.1782671097408;
        Sun, 28 Jun 2026 11:24:57 -0700 (PDT)
X-Received: by 2002:a05:7300:5bac:b0:30c:1b22:646b with SMTP id 5a478bee46e88-30c84dad33fmr14207304eec.19.1782671096877;
        Sun, 28 Jun 2026 11:24:56 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:24:56 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:57 +0530
Subject: [PATCH v3 4/8] arm64: dts: qcom: shikra: Add Adreno SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-4-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
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
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=1886;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=G5KnzOKbF9FC9XZVD3H/X6wimGnOXvf0oUqbBl4LZbE=;
 b=tUNf9WGYMJjAdYic1WiMT87XqmIviOCldRCxeamUi7NGV4ape07i3r+B/0zrufi/pAMBdRgfw
 9nDbsKCIYIfCh5m3IYARovqRiiL0W/Bm4G8HRkLexLCQvUv65gCf+n/
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX0vsCom5rRaZx
 rDDPHOGIXYUpKLVZQ6YL0cY+Big8bLQFMM8/QHpDMponr4CSkSKpp1wpW9Uc0nP0YUjwa6wObcO
 7P+buHZZTUj8XjrChltCto8PwH+lfTdiyzu4vSQxCOq4Ui52AzSa5nqBi5ddWtwkWU55rrIwq2o
 HjYbTbkWtkc0wssxmuyToPg5HbXwuJDtw4L1JqzUswBQCC5WIGKo1wsflAWJa1ifdRoDfHI54Z3
 Gg1rqLyA8z9wUlj5Mhkq00kWECbEqN3ygCvemk+GMcLmADTi6Yz8IHFtzh2fmV8WzK0DZu7kw7w
 T4tLDJ0eoYOMM+qBNJJD69yku4kniqCq5154ijcStlDitMlCrHczL5R3TPz9XfxqNBeXXCGjs05
 11MV5XvjQWWPqIP9CnWeaQG3LRtRkuYvQHV5fmdFA244Y3nB59voi+HuLYLFP/vOG74J21u04/J
 8LOHq72l6xZwbSAPiUg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX6eZD01Uvcuah
 INFAKAkCx8+qPgyLm/nR7uu8vFIonztVbc4089nHumwXnDj6JjVTBd3xv208Z4hVOWXg71uJCj1
 s6KxT8be4JvOkg/3Zbexz442ehsHSQs=
X-Proofpoint-GUID: y-xPamk3IWy3Mdwh1UXW-KXCAkv50-6A
X-Proofpoint-ORIG-GUID: y-xPamk3IWy3Mdwh1UXW-KXCAkv50-6A
X-Authority-Analysis: v=2.4 cv=Fe4HAp+6 c=1 sm=1 tr=0 ts=6a4166fa cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-114797-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:andersson@kernel.org,m:bibek.patro@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:akhilpo@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 291736D4A3C

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 1ccb0f1419aa..398cb1a4dc86 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -655,6 +655,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.51.0


