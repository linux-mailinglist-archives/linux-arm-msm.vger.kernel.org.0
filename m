Return-Path: <linux-arm-msm+bounces-69119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EA1B25CAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 09:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 599D81BC5D7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 07:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A5926560B;
	Thu, 14 Aug 2025 07:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNNdrRpQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB062580D7
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755155088; cv=none; b=C+gxIE018nwIYvNE0IjZ2P+byC5H//bQLdVfLuIRsmsj1ImI5Qm0Mt3CL25OBsboz+yci28Nu4UQLNmcm5+UENV1NdlMJcOlNH+8eALdLH2jQSVmPKsaGIvCwuN5liqQ7dgzuH/iKKlzTCN56TYPMAi1TBLCWQTpBGeS9ByrKsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755155088; c=relaxed/simple;
	bh=OPNvTv++d0Y1DCwMTZqTMCES5f0J/hlk6EFNeyS4hyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HZuXE+DTfmQVZH7xYzHwGc5J0PpXU/wqZRiJP38wZmtlUmydd0hx8kQuVhZH9iHiBAxfdB5TAdmNaQD/gmQd21CTdAVZb9zWMGWzBe0iMY2JI+xoL3lS1XcVWSVLlmYR/mmtlhhHV5D1KPRH4TmAxKxOBmQBP+GigLxnIEIyHOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNNdrRpQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DNBTsh023999
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:04:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZmTgSJksSvRsRHlh4lCCGxN6
	MG1QDdCZK4fWrb5z4Xo=; b=bNNdrRpQzXYPs/ayMZz46oM2FkiixC5Y6AUFBN6+
	Kdm5eGANHD1XRmxt5Mxt06M6At9w1ezphHaBefnK4/CVWQPlL4VjNtTdDzevnpaW
	BsVtgQ+kpAgX1HpSb51ttdWyDiYIedwu09WV7DEVwWnW6q2wyV43XAGH51nwlkGh
	aAqTzsJi8hJv31PJybLHtZpbkU/S0HD0UDub0I34pGIo08kQ1gjUXV3JcHI/ISNm
	q7WgS77xRtdkfzdGvlkutBiV0B0jjClIgIhL4SJSx9iSxdAJ1U+/wWGcsZ+cD4B1
	7qJQ9PVKO+Qk1uAp+n7boW4xV8uh5WZ8Dtl1gJHHDZ9iPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48gr9rubsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:04:46 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109bccebaso17331831cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 00:04:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755155084; x=1755759884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZmTgSJksSvRsRHlh4lCCGxN6MG1QDdCZK4fWrb5z4Xo=;
        b=oUytaXJVFQp8lNwg8Bk1XA8Z9DtXzTGSXd6Oj5byfSU9lfg6qNgG48WfF4UiD3lcKs
         0oa6WSSUysVslctcNWDqtP8jH/XvqxYa6RuIGwiCHzpPxQL9oF1Em+UalUdXktmoUrDD
         4F100heG9ECAe/GDGkCHwcfoVxdihSnCHKgAVfesg9HEU2xM77mrezLF+QKW1494kt4j
         HVz64mYfekI7sC66IJtN9BIM7sfPaVOODSKnIKptXppHMMSymAeMxhAODcuJz8bTXHYI
         9w5XDo4katwHAwdIi1Gn5f2YaHJybc0haroTlb2PNWdaIgms0AyHmbyVSw85OI6COuBD
         lwfg==
X-Forwarded-Encrypted: i=1; AJvYcCWh/LXB3aRZ/Q2cc72ju/VxBXILh6GnW8z6uA9Fzk42ulR8q6U+92fSq72OtSgN8KTjR3U2gHwAAtISnHMf@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0rBHa3/2FI8BSota9ryXvlSaXmK0sanoZCrZN1i3wXoIrgEIh
	p9D3P/y3CQ86AL8RvyBhXEsdhjjjqJHOA/93a4cwXpDvWjnqdj2brHH5Gbz0S0Q0RiEYS6XQCpb
	7itc/a1N+ZRQKnCyOAqSXMHrodXr7ccYS8C3EkUkJPsOAtLX886j+yqQWW4QUbsflFLXB
X-Gm-Gg: ASbGncsQjuBSwbkhu08k+WqhLclv39/TGc/NmcGAPDV1ZP6W4s2vqiatmLa4+H76ykq
	QmYhtOw83l8b2xuE7AuXTlYkMx1E4KJGUJQ9cq30D6RKFiIs+4ixx9CRSjWwnbiOm08RQHVBthq
	41nVmvRDD0vuUym3RRtvdU6DYaVh15lzTdqWDXb1Mb2Eme5q9htRiWhwvi4685ojjRDco+HTww2
	Ebx9hBgY4BgeYBD8axr7p2/tCZ5GxLoKSHbXui60Acr5jEl9m2ir+ZWuAsoocS7MNi/jFcLMEC/
	EwzxJwpTjxTW2vP9YVcNoU+QVSV28+EDTXgOmQPGTUOQ5iVYpBAV7+On7GzIvhiqmjfLB0Nd1hL
	E3km5skzuRaQiYQ5V2WCNUKBihl5y6haEpfEERnK8QkEeRn0jx1zI
X-Received: by 2002:a05:622a:50:b0:4b0:863b:f4e6 with SMTP id d75a77b69052e-4b10c3d1082mr18771031cf.14.1755155084569;
        Thu, 14 Aug 2025 00:04:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFf4GMEnU9+DKPNr9nEosmOJfrXRZRGgqiLTRtxITAX9r7U1qxrwlquD8TRJWARcRaI1vnUOw==
X-Received: by 2002:a05:622a:50:b0:4b0:863b:f4e6 with SMTP id d75a77b69052e-4b10c3d1082mr18770701cf.14.1755155084097;
        Thu, 14 Aug 2025 00:04:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cc8592678sm2433329e87.31.2025.08.14.00.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 00:04:43 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:04:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ling Xu <quic_lxu5@quicinc.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
        gregkh@linuxfoundation.org, sumit.semwal@linaro.org,
        christian.koenig@amd.com, thierry.escande@linaro.org,
        quic_vgattupa@quicinc.com, quic_kuiw@quicinc.com,
        ekansh.gupta@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        stable@kernel.org
Subject: Re: [PATCH v3 2/4] misc: fastrpc: Fix fastrpc_map_lookup operation
Message-ID: <nmipsdulp2roagr5g2emrijonc4xkupoqm3vdelaiihy547qlk@yvg4qmg2qgwj>
References: <20250807100420.1163967-1-quic_lxu5@quicinc.com>
 <20250807100420.1163967-3-quic_lxu5@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807100420.1163967-3-quic_lxu5@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDA5NCBTYWx0ZWRfX54mC2hcbTaX+
 RR6f8TW1qn6clzaagJt1Na9NvH3+AsWh1BEnt09MbU5tMz1V08KOcDD9pPhYhNCwe+fy0UshhgZ
 /P9i14kieEO5tzqQ0VSftQjk9qK72eANvLMnpLn0RMTMJiTtHsfcUvRUIrydS5mCaGoimxmWamW
 Bg2xidOV24snjn+GZSCaVOSCAN04J/r/+F8Nii6OnLvJPDcWi4jvTRS2WGHjrRj0z4BU3/22OGE
 ldVZ5w3+I2Lw+ueLhnOl4n4Zo78Jk4279mJd5qttwl5Qg7nEW5EnWBOW0Gz6Oe2/0YIyUmKYedy
 oUWdHWASs3Q142z99kbweYTMo7Dh4uL31kqA0oukzvGkfbk85h4JOx3iMqM6g6AzCe0SRnSOIfL
 q0eOZzog
X-Authority-Analysis: v=2.4 cv=NIrV+16g c=1 sm=1 tr=0 ts=689d8a8e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=4xMk_dLyLN26lIRFNMoA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: HofslAFiBh4sOGWShsMORrxN1pvks3Z4
X-Proofpoint-GUID: HofslAFiBh4sOGWShsMORrxN1pvks3Z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508130094

On Thu, Aug 07, 2025 at 03:34:18PM +0530, Ling Xu wrote:
> Fastrpc driver creates maps for user allocated fd buffers. Before
> creating a new map, the map list is checked for any already existing
> maps using map fd. Checking with just map fd is not sufficient as the
> user can pass offsetted buffer with less size when the map is created
> and then a larger size the next time which could result in memory
> issues. Check for dma_buf object also when looking up for the map.
> 
> Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Co-developed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

