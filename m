Return-Path: <linux-arm-msm+bounces-116728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sXdqCuaFS2rUSwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:39:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D70070F4CC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 12:39:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=igSfXDSG;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h63RaVE8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116728-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116728-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD775381B988
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 09:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B86C3F6C48;
	Mon,  6 Jul 2026 09:39:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B44A3A1E80
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 09:39:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330765; cv=none; b=GF1pBqs2GtPexJ5P30mI9jxjALmpiA+lmXrlWOm7ZtizeGj5EEc025Qk7S2AD4CGGQnWfYiLt7qqgw1EzbOUdJCnamz9Ww0uD68/vFj0JPa2bKNZLlXY43ITKfOuWa+aA9oOIUaiMnT9DpSW+Q+wxopeyRgCR9DVu4SNAZ8d/Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330765; c=relaxed/simple;
	bh=cCCe5OkOXnhSeHqZSZl1sZiScoVnvd1Ki7EsboP/TAI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kf7zr3UEIX6z0PLMfzNP4Ee/Gcj+oVa0RywP28hLDac8Dh9TP3CQv1rdJYZiOb6ZA27h8H0t+wOlT7r6UzEpPxLDkwP3/TKazvz1BB4t0X/HBkGmbxE6jUQK/r3/UVDgmnfr+Kd1oWwLhbN7LTRIMFPpukAHM/z3fHODOTpW3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igSfXDSG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h63RaVE8; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6669496A056982
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 09:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=; b=igSfXDSGDXZyx/+x
	3CJahP7NvHEriESw1Af3soF728wAkm8m07BTNRQTpyQV0fid7mWNRl02gXhYnqfK
	bcBuMpD07adRfZTDp0SxSdh2UShWruleWpw/E6BQdNodE7o93BBEDR0TdVM2WKrf
	1sAnRmnjHO5SaJ6Q4pjJWO3/NatVmggzTxajWuTS3jmic4RD3cl5WNsW0MZXgEup
	FksPk3ls5DCyO1vE6BYGTqN0SoTKCEIAjVASH6ujrtF+CXDZZw3dcXIQpjCrIT1D
	2WjGHPvi6Frnz1luwacQfR7vZbQ+uCjC3pPXQowDURBYYqvPTNHnn+/JR80Jfrqy
	A0PsWg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7gkju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 09:39:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e9c0c4492so65243985a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 02:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330760; x=1783935560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=;
        b=h63RaVE8Pll4NMK0f7uQUqqBuuM9DkWEWfK3dL5IKxynCG3AKg9SCUlDIbcN4L6ceE
         /UqpIIl+rVqbjJoWJHeUyyoA6C1tDqEM4Lv6Tha5/oug4ci/KbaIQ8yMNjr2V1qhWbX3
         DY55cuyasmedRKKRUvboxIofJqNfsG1hB+FspcoyZh2AMDaFv1rxUuy7gUZCWHE9CGPF
         zCQW2NY3zqt9T4lJ8ok6ezKL0PriDa22PFzJylEv8EwwC+QlhagOAKxd+U3lYSrCYGLC
         N6Y/KK0K3BeWEW65ZS4YCLhRMptlTGbhKN+NN/wGuzq3mewsJZ77eCsbzetgLWpcUBLu
         50vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330760; x=1783935560;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SbjCETrpVj4j77Vo3a/oe72PsOFxot0+LxVY86kScYM=;
        b=ORAwfJbzdSS31zJ0jMQEv61ub2L4YRI1bhFm636V4PuniFW86miLLR78E4rXjdHjsc
         2I85B237L/xRFphnk7VSYHGzBMHVf7vMLkdlr2qQwPI6Mh6j/L3XZnyP/vk2flTN+fXI
         PQk5pkkozKMAA2E6YnNcavxZLe0K2/9A82SuZLj0hLa3G4UpHI2l0e02z2qkbceX+3T0
         dCMYr4NQmm/HJn4J+5FIlOHOyDOphSQDfJMdQNv3KgJ+NCdTLUIkpxqvwITC284qMGNs
         P+yN4gbrdqA31NDb3TJzpspNJc0bOTBoi8PZOhxTQlyWKf6Xoa6AbSmC5bhWvPN8IDDA
         sZKg==
X-Forwarded-Encrypted: i=1; AHgh+Ros/W3cnwhfeFh5Jml0ZIFmPEgO3ww5cgv4cdwqgxeMMAOTBpnOB56vohH8jeQYVyzQjWikCJebHsTO5gyw@vger.kernel.org
X-Gm-Message-State: AOJu0YwsxpNU1OFDA5uFTFC26CdVIxM/G6X+g+hFFTpRMVKYNnTRZEeu
	2afrppDDKOLIVtuLDeqmAoIsk/C26nRDU5M2O/+jWo+DH7GvRC/o5AEGegnvJJZkzNTmqcGA+TR
	jXEsgrWHVvq64KYMM3e11chnBYo+N26eb34kNOF88xNWBiIDqK34WgNEdfCD5oDcJ03FU
X-Gm-Gg: AfdE7clP5h/m0p4WFMrxrvaImk3VI7cV21VcjeUmLGJ9CERHqR1XyXj5K+rNesAr3V7
	15NKG4xnvWXmz0z0yms6QosvfzQoq+szWzIY4yIHff58Ug7qtGsVeu9Eu5WoWxX2dDQJFcYDBfh
	e2yu2DpybbpYqsE8hwbnxN+8gR60Nll+R/WB3E3OOna+IDD27RfGwyn9pfHU+jKO3HA8p/A38Mj
	YqVvnduUkmz0Yv10epBo+Nnhp5DjgkQHDAhqkPE1VyulHoL9O80/zNT4hD+koiTNPAbdcuC9l99
	IeGQ9EnidDx3reRMT2sW3lmaotXQgsjUwlIpaV2Df9lbX1f7/fawBmY1cVrVumTmXSca9xWHirR
	VVA4uQm2QPEJNSdOGVcXGZn7hJ34P0G8flbI=
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr85762601cf.5.1783330759864;
        Mon, 06 Jul 2026 02:39:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8b:b0:51c:1c73:51a6 with SMTP id d75a77b69052e-51c4bdfe4d1mr85762291cf.5.1783330759458;
        Mon, 06 Jul 2026 02:39:19 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19daea67sm3674475a12.26.2026.07.06.02.39.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:39:18 -0700 (PDT)
Message-ID: <2304770d-a752-48c1-a11a-30978a834b0c@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 11:39:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: qcom: kaanapali: Add GPU cooling
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
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
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260705-kaana-gpu-dt-v2-0-6ac53de56314@oss.qualcomm.com>
 <20260705-kaana-gpu-dt-v2-6-6ac53de56314@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260705-kaana-gpu-dt-v2-6-6ac53de56314@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX9MFQVTpMF2a5
 6c8/cpXLqvBIjIBG7GrpjfRmcXymqacdssn+v1NY+Z20raiO+m/1V/w/YT192rdq+1dUtnXatBG
 TcCMdTAQRxgJ1ebG2/uM0U3NeRfpxrVIw2c/TYhs5ad7v+Kd8nTzQa8UHKM2XVDJxTF3d/YnJuT
 q1DRW2spzxl5+ap/5GtXGjPV2s8DdoKKL0lCQLFGcRyLAH+Qj5v0Bcglc/rSsN+Ea7PRPNrYGRG
 IvzosY3ruhxPpK2A28NZi0wueZyeLhHV4IGKOsWIjijrchTX63UisIx5vhkXcJVUJK6xOdA1k11
 Y0wzGzV8Yr9PHCAIkb0c1Y/IGVUYx/kKSkGwRmK7drLoe+24Z0lk/JQPk9TMTwJWybFCnkP5PN/
 zp3LF6gSiT5C8LqYfFN8yKKOZXFN26m6fG7pRg4N6Kokw6GaYF/y9AxishAxgtkkMWXJlzrkWHh
 nKYr+wC/NyEcxspzdww==
X-Proofpoint-ORIG-GUID: QMpLf0E8BxODD8OzZCcQ8g72wlqcQ2UW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NyBTYWx0ZWRfX5Qf05CCIkq5V
 mRImrq3I1kKbLuoOlHhnm7J54c38Lh/YOhbbYgYwlhVLodYy4WfDTHXz5rADZwCDGYacextOHrD
 Scg5dEcOia3YHOeVb7o/UPaDvz+e0ho=
X-Proofpoint-GUID: QMpLf0E8BxODD8OzZCcQ8g72wlqcQ2UW
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4b77c8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=K30R3rYzCv3NiW1yJugA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-116728-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,linux.dev,gmail.com,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sean@poorly.run,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 6D70070F4CC

On 7/5/26 10:00 AM, Akhil P Oommen wrote:
> From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> 
> Unlike the CPU, the GPU does not throttle its speed automatically when
> it reaches high temperatures. Set up GPU cooling by throttling the GPU
> speed when reaching 105°C.
> 
> Introduce a passive polling delay to ensure more than one "passive"
> thermal point is considered when throttling the GPU thermal zones.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

