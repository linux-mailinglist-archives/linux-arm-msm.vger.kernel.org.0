Return-Path: <linux-arm-msm+bounces-92023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNgbKvPKhWlWGgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 12:05:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2AAFCFD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 12:05:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3AC03033AA1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 11:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2A83314DE;
	Fri,  6 Feb 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ro4G1eX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbZ6y2zK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3597023E358
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 11:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770375749; cv=none; b=lDiTsyhEl7/QRzYjq4KyPkSVDZTWwFXiM+F1bblhRstOQrmdTB03h1f508SSJqyrXHENs7DGN7XdRgI4qLKQKspFfKvh0z10OEjPK7GXeg52eE1KngSHQ2+jYRpK+lKw0icGu4qoEwZOL7YPWzyp250tf9m3fLb79YZq+DjmMpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770375749; c=relaxed/simple;
	bh=kyjXQqXLEakUK4oJZzFyuNQhsJPPYK378hu0aq6KMl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lgh+9IKYOGcameWyk+CMoId/xEZQCvwt95bVMFqEU6vJc5/t0jAnI2GvR+iXQY9ClwKkLO29lzs62C3uru891M4Vpbkw/7cGUaGRjrgwOvPOx+4uH0ANEwYT+u3ZmnGgeVFy74KZL8VlqqSm/6fCE1uAOKZCcjJHUfZF4duwhcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ro4G1eX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbZ6y2zK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167Xe2j1852690
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 11:02:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lPVn62jF1j24nBmpNMUx9tZxl1Kn8T7Lu7In2hZBSRU=; b=Ro4G1eX6rvt/VmTL
	pB11j8gnkFz42qz3SClpAm6YIWmxd10fZfpRMjhzd1eQ225/PaRB42K8uWxRMgd5
	ZbdKtEjjtBQk0lklwcePXkIxIlTgKqVmVID6frEGxek6YHv1bBGxqVorBW7pL8HI
	+vz43LZGFeztPZ5wq73HH2zj5CM/9YlDQeaS0zYVcvRbi1MbNHCuvR93wlBtJ5m7
	X7E0uzM9CKrwyXCI5xsbAsZ2xZovRwTLqjr+IWb61C/Mm30Hl629kV4acAlgoQtK
	Yj0vg/mXTvAPcwWK2x+1xYGXpFTsiLOrMFIIcLQkqRh1ymjPoMwlf8yNOvGx3zLF
	BwcG9A==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c148ncq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 11:02:28 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948bf3b2158so463187241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 03:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770375747; x=1770980547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lPVn62jF1j24nBmpNMUx9tZxl1Kn8T7Lu7In2hZBSRU=;
        b=YbZ6y2zKBQRuedZRE5IdvXVaI2hMfToDyyqUDWZBQtx4MFlVB3thhjjl4FqurLerbA
         beG2Qt+DyH4anC+e/13XbEmq6vBclXJJwdf/oH2eoT/bzD/4QDv8gZ3uIa7lgXqBEb8W
         ZHe/0YVFNh8OshdfSkWc1Lg+NUwiDBhz14L2SkPtAhbQDMz/5infbI7uZSx0spIy1FYc
         iFzl+3wro5ETKPadVVQHtzo1w99fX5H6y1TimUgC6p9D+NSpYMWzPta2r03QNw6ihr7A
         07UzWKR+h89GE9nlTnsMkYsAc+wwVScKMDyFlVZ0hmDYWHTbenEffKNZriTxpo1SFwsp
         +SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770375747; x=1770980547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lPVn62jF1j24nBmpNMUx9tZxl1Kn8T7Lu7In2hZBSRU=;
        b=T1I/bI94P3pNfW3NKIhm4SJNikX8ueMPG1aiwv5rQD+TfEhRVVBX7BvhqhOqxZIv9L
         E39Kv+hCmU/T1Guobtc2/oJyQtex1nVbQmDMx48KsveTTrEl79vQ/6PzTc30vQitgODb
         Un5bC7gGTUEauaruytFS4FCFzjdZnN3wTCYMXi/tQbIsZV8lbsSrVlN+uMGKJsBnORM4
         57N1R7buLYNX+GvXIr6lS2eydV2MSxyb6NJC/EYsvNP/YlIZCvor+pz1nW74Tmmi8ro/
         p6g/kMmB9elhseWnZaXKMgTm9B8TluZ8GhDQHcri7IfTaTJP43Yz2kxbqhhXHVwf5esb
         d01g==
X-Gm-Message-State: AOJu0YxaGgNljV9mHNElluY74mk7nmLoNnBfMdCS7N9VVz0T4yL8359n
	jOwVrv0pgtAwh82Vx5Uba7XSjADJ8if1BUfw+PmVh+Q1yDI2HlyTlG/s2W7qN8hnyRbQrB0e5ZG
	CJMy/7Immx4U6v2nWUP21u04SuGFpTsqApUYxr9kVPpfpKbSD/qzizEOhB6IOPMReA5YaX/pLkC
	00
X-Gm-Gg: AZuq6aKZ51wBB2QM5ZR7sMWjBdOkis7ZqaQY1di5snDJgYXkGlyNQdsEOVimUGf5FFK
	aK5zoWevbOn1cd1mnUJZXK5RVGSb8QyhhhQB905RUsWdQlDARFUG05tW9PQxec+Y7DWlW/djByt
	5W0696olETDzYkLWKydH9uhMAzLAqC7d2PH6bTz7kVs1fY5QDgZjb9d2dfAk5jBFZAv0Ju/tvSY
	rwa1sdqYMJjUvW35ZXQkXqrHUJBsIaLX5/wy4B8vw6dm0cHg2Co2XrJH6S1ZZYA3X6I3z0HhBrD
	PWqX4fYKXwtgqIAf7junePkiPqrWYPu7xse+jeRLnQNHM8gceODaFUE4gsoqj346aLnI1nV6cWQ
	vHLScI7UsBwRQGgNwWohvVZ+H/QOZdUQGKzt/rNRi2/zZax+XVtZfMDKMVxTx1r2Jo2s=
X-Received: by 2002:a05:6123:5d2:20b0:566:221b:c68e with SMTP id 71dfb90a1353d-56705eac59emr291756e0c.1.1770375747203;
        Fri, 06 Feb 2026 03:02:27 -0800 (PST)
X-Received: by 2002:a05:6123:5d2:20b0:566:221b:c68e with SMTP id 71dfb90a1353d-56705eac59emr291749e0c.1.1770375746797;
        Fri, 06 Feb 2026 03:02:26 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edae3c255sm72414766b.62.2026.02.06.03.02.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 03:02:26 -0800 (PST)
Message-ID: <af15838f-6a31-4017-ae5d-7b5e30f24aa4@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 12:02:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] phy: qcom: edp: Add eDP phy mode switch support
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260205-edp_phy-v1-0-231882bbf3f1@oss.qualcomm.com>
 <20260205-edp_phy-v1-3-231882bbf3f1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260205-edp_phy-v1-3-231882bbf3f1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985ca44 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=aJhC5vt3dY1r1Tj9l4IA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA3NiBTYWx0ZWRfX4BD2gPgkxGj1
 SEhmU8WGwgn8TjNDym0yd5nG66+QKIQ1IoEFnv0abJSAEpXTAfT8KwQSKuqHmsREl8Bb5PhFOYo
 tsFQF4oAdRNcyU0fWLPVAcpD8SE1ETBYFkT0lXL4gD4lNr0b1U7ULchk5CDsCwdMq41iIUOlbPI
 8j+p4DH/ZD+z6DUuIbSK7KaYaoN9MVSz/cXF4XyYkxPIwe0ZVXgHvYms3RLZ+XPePwUqgZOHnqE
 UimxhZUhxCdVMTsIolS8ul6JpXKdDDuW4SlnRu25yaBgJyIPYPBZ6Sfd/rQA92oi9Mrcd0LTlzf
 9ufj7Oy9IB+DYVskbHPNpdRKu2XldXxBxDQwCFEzLD/dKXk2kAuDh3fmUK2qiiU9u2DpMnZCCnc
 3ayvTgNiPyEAcPpDP9pZE/TBKMLc4542vkX70pAw9aZw2GjFiXbknDSa99NKvyJm+hAxKiyAG/Q
 xSEJO3f4JHlg+7h1oYQ==
X-Proofpoint-ORIG-GUID: JAk68BNfowU70FvQBKD-MiawcM3hkKpA
X-Proofpoint-GUID: JAk68BNfowU70FvQBKD-MiawcM3hkKpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060076
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-92023-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C2AAFCFD9
X-Rspamd-Action: no action

On 2/5/26 10:20 AM, Yongxing Mou wrote:
> Add DP/eDP switch support by splitting the PHY swing/pre-emphasis tables
> into separate DP and eDP configurations. This allows the driver to select
> the correct table based on the is_edp flag.
> 
> Add a dedicated table for the SC7280/glymur platforms, as they are not
> compatible with the others.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---

[...]

> +static const u8 edp_swing_hbr2_hbr3_v3[4][4] = {
> +	{ 0x0b, 0x11, 0x16, 0x1b },
> +	{ 0x0b, 0x19, 0x1f, 0xff },
> +	{ 0x18, 0x1f, 0xff, 0xff },
> +	{ 0x1f, 0xff, 0xff, 0xff }
> +};
> +
> +static const u8 edp_pre_emp_hbr2_hbr3_v3[4][4] = {
> +	{ 0x0c, 0x15, 0x19, 0x1e },
> +	{ 0x09, 0x14, 0x19, 0xff },
> +	{ 0x0f, 0x14, 0xff, 0xff },
> +	{ 0x0d, 0xff, 0xff, 0xff }
> +};

This is not quite in line with docs for kodiak. Now, if you have
better/newer sequences than the HPG, I'm not objecting, but please
cross-check

the rest of this patch I think looks fine

Konrad

