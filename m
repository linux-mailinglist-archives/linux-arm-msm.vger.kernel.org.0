Return-Path: <linux-arm-msm+bounces-116507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jEIONPcPSmry9wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:04:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 382FB709560
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Jul 2026 10:04:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BezB4TOk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fCMUFXFg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116507-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116507-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 067FA3034B29
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 08:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70E436492C;
	Sun,  5 Jul 2026 08:01:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838BD35676B
	for <linux-arm-msm@vger.kernel.org>; Sun,  5 Jul 2026 08:01:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783238469; cv=none; b=ErCSmZ+tzO32XF1S8Zkl5kX3N3toxfm4mt5Adu/xG2pebBB2vsz+YlvOiyrb7ApdPoIecre+Qw5qI3243+8a7I+4KA03TAhTyoF/O28kfDG9Morg6V+eEZUpqQYiA0D0GV+Buk5vyEM1JS6I/JwLhwN83YGeVX5Dt0jTl2XOJHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783238469; c=relaxed/simple;
	bh=rEVRE6tS8OEt2bDdC+eNcX3SJvvj+nz8Z0ZGM3xZAcU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQqSeZR73MmlrIq546f878n2PRprrWJ1e07vi/yJkZohXH1q8etUcuRv/HupPrkU6ECxtgtauAXMrcWAAIY2UNlOMwJ2Jswi5mqGQmYH04UGU8AC8GsLjDKtnCIUvAqH7vpXvw9I0UThJOz8NZ/+nwJCG3/GHD+ZGL9fRN0Px54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BezB4TOk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCMUFXFg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 664Nj9MU149790
	for <linux-arm-msm@vger.kernel.org>; Sun, 5 Jul 2026 08:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=; b=BezB4TOkjvnOWtYw
	UkpcpbynKs/qu3POkRXnKFaGwJevrfu+kK/8Zu1sks6qnMGiD1WDvPTEGF7ZAAkH
	iA47ybIsJHYT7bgr27fVi1RV8SB+2OH+tYgooo+dsBdXi/4VcXmXesOT1skFK4gg
	2WMWz9oiq0fYfd2fO3cIjgCB3AONBBvQWYq+f9yxFqMLglGeZcJGVXYujWq0o5+O
	XQ2k5sWsADvSPN0Gfj9OL7FnWRpGmdHPgXuPXzKVQrA6vrSLrNwPYcRYuqfNpMJt
	KRqQfDRMCJghmhrTux9jVCys5W7L5gJ+vnLofnW8BWwJUALtSAbf84UTU5h+OtqS
	Vxn6sg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6sgh2d0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 08:01:07 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so1761670a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783238466; x=1783843266; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=;
        b=fCMUFXFgnhgZZRf4Hn+b8ocpcxbC9UJnytCC6DeJjLGkeU7//fl8DLFjwLXzx2WtJe
         EzSJxgEi10EZY4Rdr92zJuODOk22PTz6TNWozyBPs7KLqQZn9cD133nLBctpDwcspSH+
         Q0ocYKoM6OlI5cdeiO2VPSAjxAaj7maRW4h0vl3h7vtker+mZDywC75eyxGxqLZvtDeo
         osV6Zjc4r7KtaxZc16/c7AShDK9X4LROcpVdPZmbSo+s7eBsxQMqjEef1DarxcurI8xc
         YBbcGJ1Z5A8myWj2v8z9Vqy5Q1mjw8fep6A0MuKHxjFGns+tKYeHJ+bJAeg8DBdhjGYR
         InWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783238466; x=1783843266;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1GLzbMavJcBjpxSXBuazEchU/ZHqzUf3tHtHLBksp2U=;
        b=r4EoVzCAjPp7svZzp3sORngnUrRN+/BiE/EIZT7d/Zuz56tyW2d69sJX/mVL+88/BV
         1iO6NBRPULj78pYZC/vJR2/TLt6rd4OAx3ooKCCuUDkdzJK9ArKMucgEDJcvL/i5eD+N
         NwTE/uN/VTiYeU9vuYI52+Nm2s8EH79NrudJhmT9Qtf/n0bfy6KuoeY0DVnFQ7aGdkKl
         g88Vu2DnMuUYflmPQDSeqsfWbYZxRvl40CmmqZPaa0Oxv0FfIJckTJmdh8cNLcCWqPCz
         PCIUGotm4OexebqbNJtQJflg00NVvvezZiZyzdlM1gTkGRBeTz/Jt075WghTaVutxEn8
         8FNw==
X-Forwarded-Encrypted: i=1; AHgh+Rq8yFv74LCsKH3ksJg+Kgi6FkBnSbZ/mEN2XUyDHcGPszU0JBvk6VbgZXIqee7P2oBpZ4e6SZOB34p7ld7I@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXJi2PDEeVe4/NrFrZvwYko/v5jh/hNqVtb/WfaxDiskcuwUo
	vD1+d3TCLW574gmZF4iYCOeusRBXt+Gnd3JiHuhrx2LZIA9PTJEbCMdZg26m3JzWDkpVL6FG8H6
	Jjlmvg1j51l6crYVgFhfGxqEftJC2pQNfCKToQ3wKa4MuHLoV1Fh1iq/TKf9pgOBxwsqY
X-Gm-Gg: AfdE7clvF///gR7n6dq7sl+6pk3xhkdYJzkn0OGL5/B5jzraMd6IvfcPLcw/WSFa7pK
	OLg7+mwOCS5W26FJFaQbjqStONPPeGyHui+hocjjpfM3nrq39E1MQrI4AkpSo7hr/xVx5jzWHeG
	b3rSPQnVmzEmt0YSH10nMAsnCVb/ikaxIWZcJiKfn9gNLqWSmu/sPQ2sgaPjLIgmCih3pHp9y3j
	xR7rp/xhMxN2Z8UxmaekiFQPQQntPkVwIlYEZUxUsrXCM83raXBhKegWa0oEbokbNPzKTIH1Py2
	BaF4VQbMVWrq0FKiFp8Qy38UloITOPq61wA8wLO/zfBkpC6r2GgDmsa4dcS1xOaCS/R7UpknjyM
	rSUrOZN0W8Aycg84Jcb4ud+3tIed5/GVbaY8=
X-Received: by 2002:a17:90b:38c8:b0:37f:9cdf:f03c with SMTP id 98e67ed59e1d1-3829f7ece33mr5155178a91.31.1783238465520;
        Sun, 05 Jul 2026 01:01:05 -0700 (PDT)
X-Received: by 2002:a17:90b:38c8:b0:37f:9cdf:f03c with SMTP id 98e67ed59e1d1-3829f7ece33mr5155121a91.31.1783238464724;
        Sun, 05 Jul 2026 01:01:04 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3113c88041fsm7759179eec.15.2026.07.05.01.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:01:04 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 05 Jul 2026 13:30:06 +0530
Subject: [PATCH v2 2/8] dt-bindings: display/msm: gpu: Document Adreno 840
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260705-kaana-gpu-dt-v2-2-6ac53de56314@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783238440; l=1293;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=rEVRE6tS8OEt2bDdC+eNcX3SJvvj+nz8Z0ZGM3xZAcU=;
 b=GAsTe5la0ufNmjlUop0lHQSJGg7ejUO8suiNPoqkpIJfG+V5N92J7e6DKYQWZC8idtEXAlIcA
 yq80BjmwnsvBgjoxZvpwNTPTexaH1YVNCh0nbT5Gn+LBYJAXWitzzKO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=bLkm5v+Z c=1 sm=1 tr=0 ts=6a4a0f43 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2rxQ3qtc42-NlUa7jS8A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX/XidOxRAqW87
 E02s8RRgW3c6rEKgNtEHzpkOqzavfmis6Amw3S+WmDXiNZcQq8ieF65bAnGDMGqdfc5W0uSXQa/
 jKVH7jiqJmN6NZSmv8XQ+uHQWkjx0lyosdJEZFELmRn7nrQMQRiK7DTcAPa5oLmA3kLYEEzLi4E
 SuQjQ3FI2Zx1Kidd44nW0CxfLsxD8v75GY4CBHVxew2z27YeeBB+sUXzFbrD1DOK3BrSe5o57Ud
 2YlpiRIDcZw3MaDRHhZ97+CpnmWV67754i3t2S1sIAR3KI3w8I5gEhZ/tekjaDYVFTudbRVn7jo
 rbgoT7LVhnR3vPLGMJlacwUJiE1C9y22L/Av90XHpDbh5TJwI0kHbhbCKKufPDj5acb2Ks/oiwz
 09dBQ3yEJZaVH+k00D0a74rPpBq2MaHIeA8PlG5cQ9btVAXd/Nkeccp1fCtVnaGz0/7odL4qd9r
 T8xsPS2WLFp8psdUM9Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MSBTYWx0ZWRfX2D/qLOk7BuUK
 NNj+MKgbHmykF2rBO7lHwOddTUugrIPxLta+z/HlUeUM7iWsJkN3fSPFEl/FzFzDwzk/JJAPr0f
 GOXEF9w30JPfOZwiBiSFmVfnFjKS8ns=
X-Proofpoint-ORIG-GUID: DLL2FkxKNebhGB5Ti6MgaybUoPsK8sQ1
X-Proofpoint-GUID: DLL2FkxKNebhGB5Ti6MgaybUoPsK8sQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050081
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
	TAGGED_FROM(0.00)[bounces-116507-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,8bytes.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:akhilpo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 382FB709560

Adreno 840 GPU found in Kaanapali chipsets belongs to the A8x family.
It is a new IP which features the new slice architecture with 3 slices,
raytracing support, and the highest GMEM size seen so far on a Snapdragon
mobile chipsets. Update the dt bindings documentation to describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index dbbd8b814189..d0b7304c17af 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -413,6 +413,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
     then:
       properties:
@@ -448,6 +449,7 @@ allOf:
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
               - qcom,adreno-44010000
+              - qcom,adreno-44050a01
               - qcom,adreno-44070001
 
     then: # Starting with A6xx, the clocks are usually defined in the GMU node

-- 
2.54.0


