Return-Path: <linux-arm-msm+bounces-94818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOg2B3BZpWlp+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94818-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:33:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A9E1D5994
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 10:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 297553020EAF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 09:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0144238F622;
	Mon,  2 Mar 2026 09:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmWlgbr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvBZhf+G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58A4377546
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444012; cv=none; b=ATN1v8N4vBIIaL3voVGDcf0vXvCuO2H4pkH2MmwU9Raouo41t3+nXjn5E8uGGaxfIlRUquvZ+alXcIMX53YqMhJ3rOwKfwEx48/+p3voZZ8XKGSE6/xxU6koirtJwiyAlbmVl0RLnyv2LfPhv+kJ5pm1Xwz5lMXI8eIWVAZz7+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444012; c=relaxed/simple;
	bh=wY7IfBK8MfIbdgSrQbHeq1IBuOSDLU4dySVR+TMj+EU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f4gkJb0FKijqKU3SJ8wFEgprX3TTcvYuvEAz9xew42uPIg0wMXetGYk+TgEyQUmsPmY79WVqqzVCUE42iyMOXRbt7ThYn8azXSYYD60tVLrD3JEzt0YMJ39wMZ4TSz++CrzO6Z0M9f6r71qfwVuDVcWmsqSKWkkwJbVrAX2P7bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmWlgbr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvBZhf+G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62283lHc249402
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 09:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5ubBi6Bvh6rrf+XIS9huHc
	+cLy2tCgROMoo7C9gzJfw=; b=jmWlgbr/epNgbaGvrcR3koGVziEIaQZQlvqU4F
	WCMgULjd6oFL4S/cxogG+Aen9cmaYtmK2jTs9HFLlLq4Iji/JZT4IVYcO7GjtNSs
	ZZjBXv1rn2rM/mD5EL9mNEiSWokfWvdqE+Z8337U1LAI7OBSYzwp6QdpZF7sa0cy
	TqHfI95nnPfbP/FyGfXYdn5t81Vx4YWHk9Gd0SR1TW8L3s8dutzJw4dWINAgtfNt
	MgSYGVjnJinhJM4v71hqZ/dIZLCo8lb0oudH1YLESvdLGV2Hcse0LUpAPfLs8xw2
	TwYKsfCZ+pjQCC9PG3z637jQw6VYsZ/khxRAmuMFdMDo3Iow==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw649r69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 09:33:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4a241582so2932342685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 01:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772444010; x=1773048810; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5ubBi6Bvh6rrf+XIS9huHc+cLy2tCgROMoo7C9gzJfw=;
        b=GvBZhf+GVKPA3hQ4WikQU1VEuN9uZejYR7w7iiDmByGOW/WYN4FFUkh6F5XYMDVypy
         vh+M3clj8Ojq9XhnkodDRYZpkcB2QB5oyr3dZPboIFEY1u/Y5YSisB7fvEEgBb5dpws0
         +Y/Pw/f1OAvy7ta3vcZhVlgRT4PKs7QIEORAE9txAoQdS3hErN6Pu/AbhR+s1EdERlX3
         oXWo9l2uFEWKgMUl12Ooth2M3FjUNMjzRRW7OClvqoHcqj8f2zIFY+nwbp3N60cd7VEM
         GxwdX7zwg4QVPjZayvgU7gYKIAPYIGB0vEdfvcdja08LUViWmQgdvo7KU5FobmI2mj/C
         Q77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444010; x=1773048810;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ubBi6Bvh6rrf+XIS9huHc+cLy2tCgROMoo7C9gzJfw=;
        b=Hq6IDG6vY4sDx9tFgw/5VEeZU9f4I5RNGctrm8qPUQ44LiqJ1dsKE5zmTPFMqgzArt
         qhhpclelb04YtfHB0nKfHFFW4Ly16vDNSyft5FHXhV7D0q5Cdo8yFB7/ShjBir3e33MZ
         fK4LMm+NOBKb2rBmUM6AZo+XGBpSuDAcFJWp9b85WmzELoGCzEOic9pVPNbNbp/95lwD
         qU/NluJ8IKDM2NfufvIPcq+b5TydWhDqXWGRwcC1DfurlQPiIm1Hw2tBBChRA6/jQZGb
         y63Url6L6f/SMYCvFkK4xdMKtXgIA7Xw7S3+EEw5v8Haw0Zi/plTwJJEMKHyBezXD90w
         5OBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwwTeXHdjzwkKzb2pZ182+8OMycp23lYYQEseWwZYdAQTXqjBD4tsiwJHp+rEan+eYvAZngR2T5ijBFMaj@vger.kernel.org
X-Gm-Message-State: AOJu0YyTcTX19utcs/fYGySoMXPaaqNCO3V3MAvanIVRCMCf5ydsB33D
	6NjmUrtzeNIzpZhO47oLExWakGLV1YaTMimbFhF19qvmEwTjJSLUdYHNdredJCfp3w+LF8vThhG
	MZnWw3tbc8pYEwKIdug8+KlvPawA6h5sWAszXRO7OiMfeQOst1s220BbR8W1pPdYScMWg
X-Gm-Gg: ATEYQzyJACVWTtYk1ZZ8F9pnuLpbGkNtMIAxXXS/p/zTIj5SOf0Exg/pIIWJWY0PLUu
	vVy6zQaLjdCzQByHLXbfHB3A2kwNCcFb0ypX8tP+fvlzYQEXlLYSnRSCSRAQRNQ6LbN8hE1l2m6
	vZFecusiETRFN1+4AxpwdBIa2Lx7RRtCl8b7+KN8Hj/7Xkmi8ywhViOzEveGY1YVbLN/wk2l4l9
	skZQB2jNVVh4nr+RNKKpd1DpzQN33dOO1WKgnkGQOU0mWcQ5WPReNcKQRR0ZXeK7TTcHrWcWF3d
	XzyVDSH4X5fNL9tMAHvqTU+uNIDV9ZTiatwOqx59g9SpDsGqw1VZjvOGM1WO85ZKxus5ASHM06e
	1GcbfCK7VWIOlxYrdM/bfib4QEeoFZg==
X-Received: by 2002:a05:620a:1903:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8cbc8df7154mr1251284885a.39.1772444009918;
        Mon, 02 Mar 2026 01:33:29 -0800 (PST)
X-Received: by 2002:a05:620a:1903:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8cbc8df7154mr1251280885a.39.1772444009263;
        Mon, 02 Mar 2026 01:33:29 -0800 (PST)
Received: from hackbox.lan ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b485a0b6sm9968789f8f.39.2026.03.02.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:33:28 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] (no cover subject)
Date: Mon, 02 Mar 2026 11:33:18 +0200
Message-Id: <20260302-glymur-fix-dp-bindings-reg-clocks-v2-0-e99b6f871e3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF5ZpWkC/5WOTQ6CMBSEr2K69pFSiQRX3sOw6M+jVKHFPiASw
 t0teAI3k3zJl5lZGWF0SOx2WlnE2ZELPoE4n5hupbcIziRmgosrF6IE2y39FKFxHzADKOeN85Y
 gogXdBf0iKHlhuNYKsalY6hkiJvvYeNQ/pkk9UY978W60jsYQl+PEnO/eP3tzDjlUVVOqQqjiI
 uU9EGXvSXY69H2WgtXbtn0BjZ2CTusAAAA=
X-Change-ID: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=836;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wY7IfBK8MfIbdgSrQbHeq1IBuOSDLU4dySVR+TMj+EU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBppVljNJoUYrcp3sFgJgfG7g1yxqArNlmlxiWbg
 LX04b35ul6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaaVZYwAKCRAbX0TJAJUV
 VkkmD/9amRQWuF7D6PlMnZhj2NQWbjA6DG5LlhmvAVC3EGZGJwFoG4jnfnYJO4lwoo6Wd5aGXX0
 jhKt4JeiYjupoNG6gGFS6VUM4LdCaTEfzMqmT28axTDvr1M/PILJubPkO7KSyrIPwAQnTmdE1o6
 9jeTfSco28cAAH8f+lUYPaWFU0tNoq9iiaHpP04UPRQXmlmirMAQoxqGOcS0ggU3ZFlsjmPAEiZ
 Ig7Xq58wyQ2EXHBbA4QeGPrX9B3+Up5lf6ZnYTOkrIhQVVomtvclMfKhnImrMwI4RirQMGB1Bvd
 RtF94+mXeuo8u9vY5zzTm3JJc18UaIAj5yBGeIh0XXvsrGqjp/x99+LGvs+Ff0zG2H6LCOjyrMh
 0oBAAHdCjAHGU+wqC6y/3rG9UHJF2bM5JEro7rnsAEb0mLDlXEdbdKm5niDhRZnuuYvBD7/rmKU
 lNuauvlDRxHHmspaUpB+WuwKVf/3GFcuHjar62h46raRtm5XQLfAyqkVhPaew8nlev+u6XSwSJk
 exoBlt0bNF7umd4Ib5b+5vweDolGY9b5DiqROuTSdxim3/iQw+qRkkeUXimQt5M2iFDInY8X7U/
 XHkkpVW9mLurO/HlVD/oO5fTYDE1+mHWVvn9irg2CAhg54P6spBw6q7YlyPYKiCcHHlX8d4909D
 x+9ChDaY+ozmyQg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: TNL4THU_f7HrOWHX4cl9OwgkG7xW8N-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3OSBTYWx0ZWRfXw5L5e85sE7QS
 GLJ0KUeJ3A37KxozP32KcRnUDT/MM5BulRiP/8OXmjjQxJTmh5WEPOOEhPflndDyuItZkiOzeuZ
 PoMPKDzGeSAJxsGVaxe+8whWniQglHavsAnHi7d73Fip7xEzLfMhmW0biox6IfQhWEpxuxowyw3
 02i1FfnX8qemKgBA09j6JJKPtRV3pb/yWqIefyUA0lx9JIDKvKQwyOAaj+my39im14fLzkWXnAk
 ArNqv+Ecc78lwiZW8tmyX/NBL+l9NLK8P87fFRukZoGgazWswoM3G8q2D8S7FOHwWQMlwFagIVb
 kceTBzPsl1Uwwu86xvBuHnpD6yyKIj27YVZcLaUedB9jMl1gej/nYqv5vAPjq9nAkil+rFi/eYl
 ZGZwNjSt4pAXB8VkfP8tngrMRoQZK2i+vQyAjCMIP6oCEMaYj72nTX8/WVIJ6ZQL0vRJMlNBn73
 wwle0WHuZ4qUinGx2jQ==
X-Proofpoint-ORIG-GUID: TNL4THU_f7HrOWHX4cl9OwgkG7xW8N-n
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a5596b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=DbH3OLhbisy877XqOIAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020079
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94818-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 85A9E1D5994
X-Rspamd-Action: no action

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Fixed the reg ranges in the example node in qcom,glymur-mdss.yaml as well.
- Link to v1: https://patch.msgid.link/20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: display: msm: Fix reg ranges and clocks on Glymur
      dt-bindings: display: msm: Fix reg ranges for DP example node

 .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
 .../bindings/display/msm/qcom,glymur-mdss.yaml      | 16 ++++++++++------
 2 files changed, 30 insertions(+), 7 deletions(-)
---
base-commit: 7c21b660e919698b10efa8bdb120f0f9bc3d3832
change-id: 20260227-glymur-fix-dp-bindings-reg-clocks-704d0ccbeef9

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


