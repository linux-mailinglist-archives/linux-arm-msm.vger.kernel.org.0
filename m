Return-Path: <linux-arm-msm+bounces-117024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xv3XGKUITGpxfAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:57:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4694B715312
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:57:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ST78Cn0C;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RAzgNdlg;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117024-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117024-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8C0613010F01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 19:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB923CE497;
	Mon,  6 Jul 2026 19:56:20 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BDD3451AF
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 19:56:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367780; cv=none; b=LDp7v447/JBRH9aQmjRzy148c0Rq6ANWkkClcLS0tC1IOfHEE+/ieyecFgeH7KUD8IWOCwlfc9t8P2ALEGGAXky/w0sx1SnmLpDEpCYmsm5BDf8mQEwdNXHGnduHMHH6i2YzMnmSCq1HAeJKAHlwk3qBFCnt1ttt1ghJPw7dj3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367780; c=relaxed/simple;
	bh=CoAvdh4BP4nQuUv2gkyk5lYqdm+uef55MCTt8grpLeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UrF3OvxxVY5wPCm+rPepznEnNRNQccbayHedCxyCjoh0Mi+kN+ipjVN+rsPdB1XcnMmUpTkLn39jF0afPUuCKh9uoB+1Jc85/+0asrnEsxetbobtpjXyR6d3VJ8JnXODlcA4jvPJG7PtR/sHjL6Qy61P1Fo5IDTmchQ7yqvIzHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ST78Cn0C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RAzgNdlg; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF7WU900700
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 19:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=; b=ST78Cn0CaHEAkBgQ
	hRRjEv4Z/xXKv2pMOPJkqYAqsxxiYT8or41dWgrQWnOH9cJiSAgKRORgiMr+lok9
	5tyUYKpaSbfYS4wJTiwDGn9JsKqgBBt8PD6L37SJO1XXQ6gva5mwocEWJqFYDvc0
	ujpTfltzo75l9CEPP7rBpbZQAj/QCeetpwFJ8pdaN1+N3cKJfH8YVq+W8vKza5WL
	Bha+6cda/Q0xM9PkaiwdIU6hXe+Afqo151kx0J3vFMLm9fp+o2IlYBtKOAzYFcG7
	0cWdN2uBMOoZUjYHvGBZtdePiaG3jV1Y7aC1gOPh+jPcdnnYhpcyK3T8k4iNmKGq
	IYfdeQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7ka8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 19:56:15 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88da04b719so2684913a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783367775; x=1783972575; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=;
        b=RAzgNdlgm26nO1z/jG+rGS6mDfl6bavav3pwuZAMQu24JNrSkmbqQPeuuBtty5inl/
         Z+lvBIVgKEdwWB7CyAqViPaaRoEB4BszjPIAU/nJTHARg57EgyXkb0KQSPcuIGXWy0NU
         xtxEWiJfmZ0zFE/dP6IKr7iajEdzEmkj1troSW8A46flL6WOKZQYey2raft7GtLumOEv
         3iVfiBY1Uq9tgw9GIIT0SkbWqDaB79dBG7ghKrDX2FFx6dtDsYrzbv/HyJQMEutgzEkr
         2AYfABensQF25PhKp0S3/xUcrrVvdYKAMMtOQEz8jxy7t4YWOWTeRIJ/TkOEQvVfOd9m
         zNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367775; x=1783972575;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVprqCFVdEAD2aWCw5Q12fLKvWtWmKiMoP9O+awDYus=;
        b=LqHsaXOkUDrkoYJBcTDhrC3Gc1WLl23R5McMcXTsAjTR+QxY+ncL1cNee3BHZX7d78
         b12htNEAVmIKqH1z70Xgb2LipKdZDB6jJTSUUzniQE/Lp2DN6EeviY4d5oAmlWJIHiCx
         fFeUF/tTtrfyUgJgJua/wT5vizqQukiIvWvjBC9HCMmpupGbapCxt0xxDjfTkmgNbzoB
         P0yY7i/P3nfUfnMUr7dGnT/14swEX+ERmY/92EKKpPgdETQJ+NPmjUKNPRuCDh9VqCRb
         EPcDB2esbJn8HuSeeSFi+wTjcGYme2+sVtSSApryNKi/oDxvoO8rheCBoCwsWpluCxmB
         rzkg==
X-Forwarded-Encrypted: i=1; AHgh+RoXdtRwAG5yBZ2fvLZezW8likoQ3xe6ki9B5CR3VsEKN4AdRV2J65NOSmWljjNqUsLYbUTzz+c7qk6F4xcE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+P/zXZCvYNSgqDjVWHBO6wemyUjvEsDacg5a31w60lxkBMwFQ
	F3AE8iUJTdMZJOGlA9W1ADSnXos7Uyargp8p9WjGKIBr3mG+6iJErCZ5pdkcqF2UdyM5fq9HPWx
	zBQ7Nf7pMuSMxiWefHFTm57MUJIL8aSxgbOugdBZWrl3xbSF6HlJ2NO1P6Vd1NOrfLY6r
X-Gm-Gg: AfdE7clPL0xoHt8mD9keM+MXnJm9VgxarhAChkAKJH0qu3Q+EMqMfIFY+OsDtu04B9o
	2zinrObgvUPn6Kzb6ZBBWnKuuIPqnTHiq/MWuUtvKMnlbSzClb6trgEbCC8tSZGR3chko0lzRis
	Qi9zNEq1rKFg4q6yjqwNczOm99x7qOs68OCaLkG6EVtrKeE+Rj19zyv+LtO+Dar/KWXhZMuC05i
	vP57kzonozDjAY+zhMV1fUOvKh/dqOwxlJbaLZwPn4/G0yCyRD1qu2U7j2TmM1Gg1pD64HJdeaS
	1wlen7D/8v0LbmDZTYQPOgLx5DUDmS/Y+HX3aPoh9kIrJM5hgVvbiYFhb8ujHTQdL0I0FYvdh0R
	VuND4nE+S/UtMHB8J7FOzNZ+GdM0puGR479s=
X-Received: by 2002:a05:6a20:5499:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c08ef55ba0mr2517871637.52.1783367774855;
        Mon, 06 Jul 2026 12:56:14 -0700 (PDT)
X-Received: by 2002:a05:6a20:5499:b0:3bf:9e25:1a18 with SMTP id adf61e73a8af0-3c08ef55ba0mr2517836637.52.1783367774370;
        Mon, 06 Jul 2026 12:56:14 -0700 (PDT)
Received: from [192.168.1.9] ([106.222.230.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b816a42sm90197173eec.9.2026.07.06.12.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 12:56:13 -0700 (PDT)
Message-ID: <3dea2be9-7c72-4c5a-865c-139837d294c1@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 01:26:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] drm/msm/a6xx: Add Adreno 722 support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
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
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
References: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
 <20260705-eliza-gpu-v1-3-c9f1354dbd29@oss.qualcomm.com>
 <f1d1db6e-068d-4b31-b53a-02bdac9d945e@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f1d1db6e-068d-4b31-b53a-02bdac9d945e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDIwMSBTYWx0ZWRfX2/Fz4+8UaHFq
 nTfDf4Fi63ncC659/0XB3jwZciMwBEfnW1rtREyjKTRHtEbXR2G46E76odV2gOSId5jQZ0Qp4WW
 3ysbS/8+D+w/6YxHzHssEIkYHokQx5w8jhLvAof1PIVlVwUOJh02n1h1k7TX1foYxr9+FDOfA2w
 fTU0/2mo53yHjMq+PqqPEf3uMPxCtJYytAG+5yuJUe85iqIZTiJy8G41+Y5in8vWNsMXaqmGEvc
 wi4hu10NB5g9R9ZvEyCJK3QPrEuoUXVnp1gIYvE8vDDK1JSA+BE2VS2PoCPUhMJV50r3v8Sdrzx
 xa4Eo1Y0yxTar8RDbJ77MAUnIEThBajFIt91KZ1KGiuV4KsGPvSADbCpbURN5Ppd95G3EXvg2mJ
 RrcDLXqODm1wUgIb5cHm/7ktuyB3KnwUkS+lMM6d7nq4ldb7OtSN4AbAgkVIpUGlOciv6yZRgDI
 bRrXCSw3OlaABzcr1wA==
X-Proofpoint-ORIG-GUID: tSsKV7N6-u9IgS_YY2_adT8M1O8zYFhp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDIwMSBTYWx0ZWRfX1dqNcZzpeKiZ
 SLphjCCHRJzQrq2KcVtHCPd5UWZy/apobR+eZfEizPTgVTBOZizkjW9UdkPJO1cBGoVBz24LKon
 mo8/3xuMupsTd8D6EQg6DlEb/lr42Lo=
X-Proofpoint-GUID: tSsKV7N6-u9IgS_YY2_adT8M1O8zYFhp
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4c085f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fsdq8dFr2Uux402FS9br8A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Gg-SMJLLMV3ST4U2SEgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[29];
	TAGGED_FROM(0.00)[bounces-117024-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:puranam.tejaswi@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de,arm.com,8bytes.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 4694B715312

On 7/6/2026 2:29 PM, Konrad Dybcio wrote:
> On 7/5/26 10:14 AM, Akhil P Oommen wrote:
>> From: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>>
>> Add support for Adreno A722, a member of the GEN1 A7xx family. It is
>> derived from A730 and shares the same IP-level configurations: HWCG
>> registers, protected registers, GBIF CX registers and gmu_cgc_mode.
>> Major differences include lower cache/core counts, 1MB GMEM, no
>> Concurrent Binning & LPAC support. Some of the peripheral blocks like
>> RSCC are from A740 that resulted in updates to RSC layout.
>>
>> Add a new entry to the catalog to describe the usual configuration and
>> few additional fixup mainly due to missing CB/LPAC features and updated
>> RSC layout.
>>
>> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -710,7 +710,8 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 2, 0);
>>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_ADDR + 2, 0);
>>  	gmu_write_rscc(gmu, REG_A6XX_RSCC_HIDDEN_TCS_CMD0_DATA + 4,
>> -		       adreno_is_a740_family(adreno_gpu) ? 0x80000021 : 0x80000000);
>> +		       (adreno_is_a740_family(adreno_gpu) ||
>> +			adreno_is_a722(adreno_gpu)) ? 0x80000021 : 0x80000000);
> 
> This is a discrepancy vs kgsl (did you look at gen7_14 instead of
> gen7_17? did you test this on device?)

Both 7_17 and 7_14 are same GPU IP. Yes, this was tested on Eliza MTP.	

> 
> [...]
> 
>>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
>> -	if (adreno_is_a740_family(adreno_gpu))
>> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu))
>>  		seqmem0_drv0_reg = REG_A7XX_RSCC_SEQ_MEM_0_DRV0_A740;
> 
> Likewise
> 
> [...]
> 
>>  	/* The second spin of A7xx GPUs messed with some register offsets.. */
>> -	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a8xx(adreno_gpu))
>> +	if (adreno_is_a740_family(adreno_gpu) || adreno_is_a722(adreno_gpu) ||
>> +	    adreno_is_a8xx(adreno_gpu))
>>  		seqmem_off = 4;
> 
> Likewise
> 
>>  
>>  	/* Make sure there are no outstanding RPMh votes */
>> @@ -1100,7 +1104,8 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>>  
>> -	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a8xx(adreno_gpu))
>> +	if (!adreno_is_a740_family(adreno_gpu) && !adreno_is_a722(adreno_gpu) &&
>> +	    !adreno_is_a8xx(adreno_gpu))
>>  		return;
> 
> Likewise
> 
> You also need to if-out concurrent binning for this SKU

You mean the PM4 pkts? If yes, fw will skip them as NOP.

-Akhil.
> 
> Konrad


