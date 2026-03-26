Return-Path: <linux-arm-msm+bounces-100061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PANMJ75xGnV5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:17:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF4533220D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:17:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B85B3300FED8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 08:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25D3534C140;
	Thu, 26 Mar 2026 08:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z/eOHtnJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5/aqDcW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B957225776
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 08:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515556; cv=pass; b=LhMRq/KEiufJuFZCDWQ5V7TIQ82j2d91Tom3cglZvjzIP4o4oqVMBjDenOu8d2PIY0ZiBFcHo/XwGmr8c3QpPsWhmM1lTU5Lk/74bLEnALSJcdK0O/sEeoKb8wGDGwICN95GfIVrdT9tw3FO+XWhSdTFeZBJPIzmWGeklQVZy0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515556; c=relaxed/simple;
	bh=Px4H6+Jn1fJXZv5W70EMXl8iv8Z8U7eG0T1zIOCbYdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIctbgqnOzr+JWOdY8e9tJd5yX7nDze65kMUKGlKkYw9RG3Icnf+2iExSAKq1Nj0ZvB09qMwfWrB8Gicae8gO+YBbRK3ilKg+1ux/CM+zzX0H2OzP3L60uXO/JNoQ/uWBZhxSHOOj7zUFVHvGKnXbzayl0mjbeq4ePxp4UqbWBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z/eOHtnJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5/aqDcW; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6HsFl052597
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 08:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X+InTCHF7LoGwXLOOhuuAjn2qNztxUkaPBxxy3m5vIA=; b=Z/eOHtnJcz7u7hDU
	SVr0jYOlDBWYp2gczFoshuG56R1wBuPz7kThQAqVCnQkGnpu2MneNyghWrm1oXNZ
	oYZERd4I04X7DkTYpg0z1cVHDhIUx4lU5nkERRZKRXMK2gnmHWmHma47K/h+BBtS
	V+R1DjtTxDsTFt5qizlbQKe/C7araLYRxGjKKMcnjP3ELftbnwYNH0hAQoZq8poI
	kmQBDdIs/tIyUKZE5wdw7cSL9JTSDuiu1ZZPZv0i+IbtjMaBuxERej9C046x10GB
	HgPHeM1W98xEDWz6e8Gn7u6D+60AMBOyEqfQREnzmmoMJ0sGNFN50+kd9pDqrCMO
	sV9qWQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q1t21x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 08:59:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1270dcd11c1so745623c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 01:59:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774515553; cv=none;
        d=google.com; s=arc-20240605;
        b=LNiFGngF3bgd6ys/GSDvWufF6xSOvhnv+e/eV6WFJcs/dXkPtIFmLZtnhPyFz4hmWL
         YABA/UQfeuuOUoPQnhYJi1rXlgDuQayH1FxLofC+22N8cUi3tN5oC7iIdTbxksYxYDYv
         DARi0xdnB/rbUHtCu6bxkAY7E6x3PcIXdm6MUZqa6Q3J6xAk7ylssdrmf7qe6ttfndRR
         mqT6clFIE3fWAeioI1ndlUs9Mz1z1yQfmuQ8IJyVKyE+s0y1ujxM+pmMqNwFzt803tzN
         +RcgZFyrbNHdWlDQeVoIFMbQPXgfc79GhKvfWfaTJuiibD3BTk8RD2lspEGkU68NHjxh
         zARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X+InTCHF7LoGwXLOOhuuAjn2qNztxUkaPBxxy3m5vIA=;
        fh=8AFO0YQfykgsEIqtQ//UvBF0TiljSuu0ncxo1bw/1s0=;
        b=NNlL1gRHHUT3WSMfyxdiU4t4OZUiHhgRbGM1Mucf6ulLDRGia8SJQg07M6mYv2oQN+
         jjb23AdRDsknP3uZrm2eCQ7Pe5QNnPbTFYEvT1CilP/O+f7EccicyoSfIVTs4Iw6DeuR
         evtLF1qIYamazxPJaLZstEMjLi7NZbpzN0yYcesMWq1aM4Fy2K5QVy4tjV45Six03fjL
         8HUwLC+Ro7XC1YfSYbNVFKF6afuIcN9iNqZdN/G98eVufVKywB/6NU04JnDoGb9zMuKL
         OjKiHpT2/a7jGi+qwKCxiX44XlFoBTkiuYgQPNCi3PBCoQA0RWQZQ5iAWkTIdphOAdB1
         KWMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774515553; x=1775120353; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+InTCHF7LoGwXLOOhuuAjn2qNztxUkaPBxxy3m5vIA=;
        b=E5/aqDcWKMeaWPk79d2DUh0oiT5KlPVwe86G8U8AApwXfegkwNhHDKuOVUiXPwBCVt
         Bp4dQVRrV7IKcow+gub0nFoQL2oM+iJMYdnHSCuaPQlDYRZJ+s+al88KVUxnfhpD1hb8
         LfsBF1Iwff++cFjM8iKvqeUepQ0+9RA5S8/JXRCfJqtN3F21YbgEb2IXzt51A2xvpPg9
         trg/Nk2UAbrJrkT6BvaOuzNzlFkxXR++FbCZoIFsRIaQmtgh0cyxp3MiJzGf6QTudz1j
         jSkkuytnyIHdDmRHjFQvMmS3yn22VMXDVLZlBYoVWOB9D+YvyWkht+8b3BOk7Q9zT/oc
         IvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515553; x=1775120353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X+InTCHF7LoGwXLOOhuuAjn2qNztxUkaPBxxy3m5vIA=;
        b=G7xSHloLZsc4UzntbmnJTVb1/wSREEWUTQgk8JkiidtQXweytxkrUbbSXjNS4wLBQc
         VkLJcDv4I4j/+6Xd/F5jMQNvcUmRaXMWBQgJjUfExZsqNGLLWciYWgNgrT9pIdVvh7vT
         +wQhUwjZAPoGMwkbdFzFfTL78nGFZTYFrM6ycXnmN/zI5Dgakaw8ojLEoWHvg1l8F5As
         +ewv+AV3b7TVkmdOLfmRuD5uC69YvmTTwm1sAz0l4XbgsibtBI8IxDpprS7X30m8+9rY
         HFQw1hPjdQyetgFAUNU449vHXEWc5VX55AuCZ5wypgN+HfWvZk1JYWX8bguDLvrWhs5x
         HYfA==
X-Forwarded-Encrypted: i=1; AJvYcCXX4I7L6fCHB8HycwVjsgf3R6Ty5ve9FHvhkWjvhWjUzrTE2j78jrjExsWpJf2IPSfEUfh69Gbc5xdb6XP+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk2EsLwLZBrHjo+qzv1ltBNwih3RGiTaxiHigR85QDIjdpwpIU
	V9jvMbNZ4cjk2GbORkWbm6nssd/w0aXjwG8KrFI2ZrlmRIXXER59j0I/dy/ReX/seK/+tRMpevA
	xCwK6K8cgowp16T8ECMesRhCcCNRlVdRbhD3KgREQzUPRln3YHt0jYC6YDQTa+IKBbyVS623bjK
	oUgFVdIaZlzT2H/lal1Ui0T4vCG97MbRC+/pMPJqHfaY0=
X-Gm-Gg: ATEYQzzWFLdYbbldzQQDHmpw0R8YS4hXqJGCDlIqUFgHF0QE8kFkeSxPVeYVesNlMBn
	bCCrHrAaejH33e2JzFNZHMLmPDCMjxhv4b+L1Zg4Bu0cAjyi7+qoRXKl4qJcDQhkb+uA25f9DoH
	w4rkuBGl5XGwuEqqY0y/8/Xme/wrHczfQrFd4LJX/6Ljyc8CO5aLtqdTPjmS9vEWUsi1W9NoDGU
	dJJtIM=
X-Received: by 2002:a05:7022:ea2a:b0:128:d1cf:8ab with SMTP id a92af1059eb24-12a96e46fa2mr3330847c88.6.1774515552556;
        Thu, 26 Mar 2026 01:59:12 -0700 (PDT)
X-Received: by 2002:a05:7022:ea2a:b0:128:d1cf:8ab with SMTP id
 a92af1059eb24-12a96e46fa2mr3330834c88.6.1774515552022; Thu, 26 Mar 2026
 01:59:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 14:29:00 +0530
X-Gm-Features: AQROBzAUo4DH20fFy9231utP08t2yCcbvqzwHE_c69J9vb6d_jOiVNCU3yNfHHw
Message-ID: <CAGptzHNDSYrA9U0-Ej-Ay6xFu88inPc1RM04j941HOPwQ0m46w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display/msm: qcm2290-mdss: Fix missing
 ranges in example
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=e7cLiKp/ c=1 sm=1 tr=0 ts=69c4f561 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=u0WoYhsv3NxjMHURO3IA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 7ISYOUj7Q1eq_jOjW1AoeJF55Uk78Lej
X-Proofpoint-ORIG-GUID: 7ISYOUj7Q1eq_jOjW1AoeJF55Uk78Lej
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NCBTYWx0ZWRfXz8VklodfYZ25
 Rd5VqBfKiwDY4Z14/ws+YwIRd+FmA3ajdVPRqTjrVk65qLwzEosG4Tb2QJ1/pV9MgISi7yBhHpR
 Iyns/znVmpMhLtS52UCRZ3kfa1oSDa2CfV0k/UlyqARFH5k1bYS4Tg0miIKBGE7bvWfx1KYUfoF
 RLqhDXrfJ+ZsPuQyHPZXXfb8A2nRwYqDWbMbGBarTmiHHxKA239Y0uMHQJxWBjRfvPLUKC0apqo
 z5pnNlw0lldzPn2l3bD024HoqqR92oHJv/hvGdapaESKvV9euccQ1yTkf4aBe0PJrDQpwncbfnu
 ZEnw7o6CkQ4T3lImcw8gYHTbNP5vzbIQXuFHTMUPzlh5Ullu/JA6KuWe/EAwUtewQoUnQTRQ7ji
 GLaNsxuVt+rMAiUTx5b//5m0x4TgQRydVmisxn/PC1r9RwPPOhigPzNuwFhXqdkOGv8BP7aCJhQ
 0PDUHnLIO7Wdxeo0O6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260064
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100061-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,5e00000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,5e01000:email]
X-Rspamd-Queue-Id: 1DF4533220D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 5:52=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Device node has children with MMIO addressing, so must have ranges:
>
>   msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000 (qcom,qcm2=
290-mdss): 'ranges' is a required property
>
> Fixes: 966a08c293cb ("dt-bindings: display: msm: qcm2290-mdss: Fix iommus=
 property")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> ---
>
> Fix for commit taken by Bjorn (Qualcomm SoC).
> ---
>  .../devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-m=
dss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.=
yaml
> index 2772cdec7e42..bb09ecd1a5b4 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yam=
l
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yam=
l
> @@ -108,6 +108,7 @@ examples:
>                               "cpu-cfg";
>
>          iommus =3D <&apps_smmu 0x420 0x2>;
> +        ranges;


Ah, it was surely an oversight on my part, FWIW:

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>

-Sumit

>
>          display-controller@5e01000 {
>              compatible =3D "qcom,qcm2290-dpu";
> --
> 2.51.0
>

