Return-Path: <linux-arm-msm+bounces-108869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMriMw75DWqq5AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108869-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 20:10:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A8659574F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 20:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1DCF3843DF7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 17:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B18C373BEB;
	Wed, 20 May 2026 17:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="Jb2380FU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazolkn19012053.outbound.protection.outlook.com [52.103.2.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE413D3CE5;
	Wed, 20 May 2026 17:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.2.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779296431; cv=fail; b=HFtswhdbfVAzADxhc5eSY9f/VeK5SvCbZBaRctqmto+SZ+LMNzvS+KhZHI6WCgBwZiqPFkHIB0PSG5pG9yTWXG7VyahmAkdkN2YwGULEBJf68ZFNrlBRb/pIMo5oPO/5wVFg0p60SuBq0EiH0oobWQhWCFgW3yM4g9zaz2f4/Ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779296431; c=relaxed/simple;
	bh=c4lgdg4NEJr1ubRo4gaYVLUmgczPIgSoNudrPQlWEiw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B2afmDV+ebrf8b3u/lC0fFVcBvLsyjLCwq0deJ29+RPm5xsFT9fDq1abT6D+51ADlqVzTV2qHuIKSNASzF7K8EvSutQi66aUMoogRCRgoy1kPO+/XuSPsV+jMOfm0DeyMbL0b7DaIGzcEkVMvwbUTajZc6/bGhRMqBun+cjcOoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=Jb2380FU; arc=fail smtp.client-ip=52.103.2.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HCl5DMXOWpZPMKUyHpRRt2JwfCIopzu56ZzOAml9p829RcQDZsoNYjL9SCbQ4UGPldYjmIRET7nAdZPSRsfh336Q9z1v7xPQjNuVRWEPx0QAWnMHE80lzcJvW1nPJvWZ/sdnBOA9LWSe6QqwuqUaQY4LEowpQmv3aurzGrAy5Q8EfJV+6JGJvqsXsaJJwgI7fDRle74VYvsxm3lbY4GTwAo7hg/kmZYnvs/CPyMMi0kgYtvkh6ngKlnjXRnqVr0nAqRs/nwo/uCVhyZMJt4UbSnsvBjSUav1SyHoLbsDusbQyam0SYEkStJeC9BG15YYFlYx88r3DjVqUxHBRpji/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pzoJvNXj7O2N2qjWyTavLJTC25kBDmVhtyNkIfiusI=;
 b=n+GXQAEAx4c1SkM0Fu1Z0ElOIXKJj5E3vlT1kSCxABmW29zl/7lmmeTJOS2QPTEo4vzJezG8nx48IbxTkx5rsJB1D7xRj0+Ez3fYIJVcJ+pG4LmhVjnjB2Gb+8Qg2A8NI3OuQwMqDuTNhl2Yk03rOPyzZ/AVybAPLIZieVdt9QtiC5gBb2BVssdzDuKbxTI8jtCt1m0+SIVZ/JvunclFdH8O7ZU7bS98uqAwHFq6iFbTv7rkY9CIwsIMk1RK3vftU7JAI2Iw6UqUIh6cdvzRsLaY8auH9jny8ww/PExPIOT524Xb5SHfhaY7sEDegj5mDj5IT5jSpH7o5dgf7K6CjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5pzoJvNXj7O2N2qjWyTavLJTC25kBDmVhtyNkIfiusI=;
 b=Jb2380FUx3RJ+F4Io02TPB50VEcrdc8gSuNA9UGfDrvg+sY204IZ9CCS1uuiQxNoXCcq6xydcjGvADiPR9CULaDIOtvZopQewUixJVNQBSesHCvO2cyH9YqDln6MGcRimLVI3bTrIiooFmb4iXMpMzArm+He3+yzUL232TdCaW/U0ezZnEzciJQ9HRWgX7EwsUBrjwZikCFZIvz4UHTu2Yug9sIDu4PTsW0zJp84GRrVuvP/Q2q+dkrjO7LhegfjMN1QIH/atEizTtsxeWVJg8A/Jce0muPQ9lA0rKrbfPmel/P5ZgRWgdjhkh38jQtUX95sIHM7PUia4qQqx2BYcw==
Received: from SN7PR19MB6736.namprd19.prod.outlook.com (2603:10b6:806:263::12)
 by DS2PR19MB9625.namprd19.prod.outlook.com (2603:10b6:8:2d3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 17:00:27 +0000
Received: from SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a]) by SN7PR19MB6736.namprd19.prod.outlook.com
 ([fe80::4b6c:b84f:b71c:d0a%3]) with mapi id 15.21.0048.016; Wed, 20 May 2026
 17:00:27 +0000
Message-ID:
 <SN7PR19MB67365BA9C1E41646C4D920B19D012@SN7PR19MB6736.namprd19.prod.outlook.com>
Date: Wed, 20 May 2026 21:00:16 +0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: ipq5018: Correct CMN PLL reference
 clock rate
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Luo Jie <jie.luo@oss.qualcomm.com>
References: <20260519-ipq5018-cmn-pll-rate-fix-v1-1-3c83a173c27f@outlook.com>
 <b7bzxkagiqj7aptuahpiwmvxdxitbwozgxgoijkhvi5uymqigb@scqo6uj2lzrq>
Content-Language: en-US
From: George Moussalem <george.moussalem@outlook.com>
In-Reply-To: <b7bzxkagiqj7aptuahpiwmvxdxitbwozgxgoijkhvi5uymqigb@scqo6uj2lzrq>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0184.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::9) To SN7PR19MB6736.namprd19.prod.outlook.com
 (2603:10b6:806:263::12)
X-Microsoft-Original-Message-ID:
 <56dba4ef-0b2a-463d-8fe7-eb1a8318aa29@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR19MB6736:EE_|DS2PR19MB9625:EE_
X-MS-Office365-Filtering-Correlation-Id: 30afbea0-a738-4a2d-8990-08deb6914a2b
X-MS-Exchange-SLBlob-MailProps:
	Vs63Iqe4sQmM7KNZxyCfd+5xcyAOZnIEgTO4ot9DhOw7LkuuSqtph1nZOXI4o8+Aa5O4CGZQaAxg/BF91Qz2IYhzb9qrZJOQXjUiODvlAdRFRlIZVZoQUPXyTn725WBh/APgcu8PTYJUx+cG/23t2IKctne5QVlsqZGhJegsJPO9XfGT9GZ1xwkI2c8AwlB5obvdXDJAko0Sxu24XEZ8gdbe81jy04n8DhJs/tdUI0IvfAWl2DWPiO1VtH5anUlsC2t6cpVGYhpZYiHrJ1pIxVVp9UoBOTny4L/GtM3gIOOijNOdNL/iRguAjFAC/+JLxMhM7yi2z/JmcfkRC7Her6U7jt5Y6TCbxE7OOkccerICvrR3Ks+iXOf50j3flIPOr8Is4uOcLjl5SnL8Ln143KxYj7lN2HwIyWLGi4Yd9UVxgdH6QuJakcHezLpJ6fBbnukDdUHlmLyCbiuPPQmFjQkT1fCv1g7509Q+06mi4UphM+ioRUcf/O0BFKcygQZSbga1gSh5MAx7OIyn+gRXEIoCT7GG2tZk6M4HQ+49T1wDzS+3zXAVyrF3u8X6Kuor913zZgNbfJ8NPhhD1Ej+WyedLmomtWvUEZfP/YpXyqVqQwjRQ7rvOExD3T+0fCgHf8Wk+qtVnGNKBGOEpissnSZISWecAsSnbrKQ5wO856VCG5quMXZoBtm3KYIUc7vyeSE2wd9/+mZa5l2J2O3wkP4IX3Yn/npamIbvJwckgvc=
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|23021999003|12121999013|15080799012|5072599009|6090799003|37011999003|51005399006|55001999006|24021099003|8060799015|19110799012|3412199025|440099028|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkdBN3ZTM1lNdkdPMU04NS9zdXZNNS94eVF5WkZSLzJKUGNnc0VMK3MwRWl5?=
 =?utf-8?B?SHRJL0M2b3JqREtET3oxN2pjekd6SEVaMVF0b0hSa2M0d085MzFtUHd5eXBV?=
 =?utf-8?B?RDFlU1BUY1VWVlhjUlBoNjlNUmNRdGFVNmpWeXQzZkFUN0xNZG82emJUcFhE?=
 =?utf-8?B?Zk83ZnpWUTlPVWJ5YWhZSE1HUk5remo3NktMWVhIbGsvVjVGNTAyL2JmK1JW?=
 =?utf-8?B?MTkvZEZlQUU2Z1dPWkcydjVQYlNacGJ0aVlVa0ZkUnNoVjhMeE9hWmVkZklX?=
 =?utf-8?B?ZnB1Sm9UYnkvUFlNOW82Q2s1NVMxWDFMNUhlSnl1MHVydStnV0pPUHBPZlg4?=
 =?utf-8?B?R2VFYzFXY1c5dVYxcklMTWRnOEF2S2l4cmppSXlxM0hTSUNPampReW5IL1BS?=
 =?utf-8?B?alBUNG1SajZrY01XTVZCWEhmMWdpcjJnNnJveEErWnFkemhDdC9kM09DWEZI?=
 =?utf-8?B?bTlZeGdqaUl5RVBlM2lnNkVXMElNVy9kMjFBU0J3bERDajV2OGFuVURDWjMr?=
 =?utf-8?B?cGREMlZKODY1T2tNL2FhMDRmZGRjN0EveWFIY3BubTlPcEtMalVyR3ZGSnZP?=
 =?utf-8?B?OWpnUWVjc3RFSGxQTStvSDBwNjBkWEJSY09EK1dpWDZ2ZWRuUElmUXpLeGln?=
 =?utf-8?B?ZkNEZHRHT0FUM3hGb0lzTTZKYzFybkJRL2ZZV0JUcWEyNmNGZlVGR1FJZXhV?=
 =?utf-8?B?bTR2TFR5R3FUdHc3UnpUVWJXVER0NHhkV2V5RHU5VmJKNTgzSEJDdnBYUjBO?=
 =?utf-8?B?bGFKOHN5aG03VFhOeWxma2JWRmdPK0oxN1FERU1jZkZpN0l2K2tTZ3hEZFJZ?=
 =?utf-8?B?ZExSa3hNZ0VqVEtqSjRDMG9oR1hyOHkxWGU5eHhPdGVZTk5qQlJYMXdjQkFJ?=
 =?utf-8?B?YXoxZWt2bVQvejh3OFI5MzYrOXJxbmdkR0RuNjc2MGk3ZEdqekdoRlUyQXky?=
 =?utf-8?B?SGJZVVZLYmppMUJYM1dGd1RwbE41VTlTMjJFWHhZQmVsbnhLWUhPVDByRnFF?=
 =?utf-8?B?ZXo2bWtPd05CQkVMNktYSHJhbUFSaXVNbGhueGxqNldJcm0xOGVyck8vZXd2?=
 =?utf-8?B?bWtxLy8ydzdYTHBxRXkrUVFwMklQVTI1SFkwNFhXeWRmdFphOGdiQ0lrTE1L?=
 =?utf-8?B?SU1VOVpKWmJmcUhQZGJkRXAxRGZISWF6eEV6T0M3SEY5cHUrclZrdWMxU3Za?=
 =?utf-8?B?ZkFJZFZkeTZoakVGZHdRM0QzNEdSWHVhMXNXT0FjSnk2UC9Yem9vaXBOcXY1?=
 =?utf-8?B?eFM0ZGRrZG5XUm83SERrclg5LzhoRnl2YUZqOGwwb1R2UUlBU094OFBOQWFG?=
 =?utf-8?B?a0tOMnNuUUVENm1xZ3YrQ1Q0VFdZNlJCQXhyRUk0b0FBYUhTVjFDM3ZLczFZ?=
 =?utf-8?B?dEhMR1MyQTBic1JTaWFaUk9xditpeHhSa08zU2k2cVMvejdDRU5tZGkrOExC?=
 =?utf-8?Q?I0pn9KDF?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2k0OEQrSnJEdFZhTEpEck9qZnVyYWRTR25mVjlIVXlDQWlqM0ZWSE9WZkgv?=
 =?utf-8?B?TWQ4TWQwc012U2FuN0g5VzRnY1k0c1RjQ2pNUTRuTnhFZGpXQVU2UzhmVUpT?=
 =?utf-8?B?KzY1cUN2blZDSHJoWlpXNks5THBjRjY5c2hEdkhORUxXaHVWMERIbjU2alNY?=
 =?utf-8?B?OHUvS2ZUVGVsNHI0VTc3STgrMUVIMzJEaW93SzlpZDhmUWlIZlJIOWxZamtn?=
 =?utf-8?B?aUM2aUZZd3VZbm1lM2UrbzdJOVFWZlNKa1JCSFA0UVZUMlVpZEtrTDdBek5u?=
 =?utf-8?B?LzFCV0F1MzNEOHJObGZyc2FQSFBxUFp0aUVvNHNBR0VuTTBLU1dNOXF1clFq?=
 =?utf-8?B?dksybUFVQjgzMlZxUU1wN0JrTkp5KzYxOCt0dFp2UzV4UnBqYUU0ZEQ4ak1r?=
 =?utf-8?B?RFlVaVBrVDYzRFFWWTdNUlN4RS9IUHRMNEVPWnlpUlEwSUVXOUhjdFVZMG4w?=
 =?utf-8?B?eFA4M1ZMWkpMc0Z5WXp2KzF5QXZROXZyankyYUo0VkRQS2RPekw1SmFEZjVw?=
 =?utf-8?B?d2xpS2o0bHdOMGU4Q3h4ZXgwUnhXOEtMUkxrRWpEY3ZCNnJDNGFoNmlKdXlo?=
 =?utf-8?B?NGE2S25Tajd3Mkg1LzdoVTRqYytMNmlvcDVlaGZhSGVaYWhvMlE5dGk1V0Y5?=
 =?utf-8?B?eFNBM1gvSjkyd0Z6VlhjZ0NTY2IxTCtFcENRRFRoUVVBNk5CWVY4QkJVTmll?=
 =?utf-8?B?emF3Tm9UWmNvcXYxN2QyZGhDWCsxdGJWMmk3bWRHQXE1UmZLRjhveGk2MGd2?=
 =?utf-8?B?WWw4RXVvM0JtVGN6bTcxMW10T2oxckxrVC9keXJnaFg3WEE3K2M4cmk5ekl0?=
 =?utf-8?B?WXhxektuUmg0ZTd4Z1VTcW45VnVvd1RXMEtYUnRld3dpZGlScFFNb1lxdUZs?=
 =?utf-8?B?T294T1VJUzFadDF0NFY0QnVrenNISU9FQUhTMDRtOHdCdHd0ZVlONmdpd3Ro?=
 =?utf-8?B?T0VVK0FoQitmZTR2Tm9BSnIwOVB5Q2NqTFNyZ2h2dTdnc0MrMXpLcnJtY3d4?=
 =?utf-8?B?ZjFnMUoxS2VZNlQ3Tm43US9CM0hiek82MGltVU5TZ1pWMkdtWldUSkpWZllu?=
 =?utf-8?B?ZkMrYSticW91WkkzRFM5NjBjZldGSzZ4MFFNVFE4cTZVM0pDYVc0VTBrU0Mr?=
 =?utf-8?B?ci9ZOTdDQ1pDTGt4bVVqb3NQSkJKT0lzRkt5RCtSMmZJeWZvTjB0Mk8zSURk?=
 =?utf-8?B?U20wVGNsUTg1cjBkKzVDREtnQ04vckxBN1kvSWJpb2xBbWR2bVYxWWIzQ2Nx?=
 =?utf-8?B?cHU1MnArVG90ZUpBV0UvUC80Y3ZBdUY2cTZOOHJ5Tm1BbS9FSmV5ZmVRSVBv?=
 =?utf-8?B?NkhYYWhpR09xZ3BEc2ZrMjB1QWpQcFJVaUVpZHUvb1k0aWRaeWR3U01LdWdP?=
 =?utf-8?B?SzZraExiY2dWeEplcnhrbGVCNXRxU1BWQi9TOGhIZVR0UXgxSForTzlSa0FB?=
 =?utf-8?B?ZktUTndtdFBtSFl2R0d0cmdFdlNWNC90WkptRXpUeFlGRENFb2IwN24yVHVj?=
 =?utf-8?B?KzNGVTJaeDlqTWFqaWRsenE0MDlKa1BFZlBhVDM3N2M3bUthU3k0Ymw4SlVS?=
 =?utf-8?B?cG1SSitFSC84RzRVTDdmMU9HZldremkvNHlvd3BHZTNYeVZ5M3F4UnBVOFdh?=
 =?utf-8?B?Mzdqd2RSMndObmpqYjNjL2lKbXZqWUR0VHVjK3pvSFgvaElnaEFENlNvaHo4?=
 =?utf-8?B?bWNZMUwyMnByeGkxdkJSVCtzT3locVh4U2Era0FpVGpiZ3hqT0NhbDZiVkxw?=
 =?utf-8?B?Vk5ucHlwdnBZODJwcFQ5MjVzRE42M3A5TExDZGlVY3VibkpsVWM3Zmk1UVBh?=
 =?utf-8?B?eXJpY0pUQW9GenlTZFZ2MXQwTkdHM2g1TGhpaGkxV0wrbC8zNVJOU2NRQzcx?=
 =?utf-8?B?cU9LRFVKZ01mTDRnNGluVkxmZm5KR29UYkNOUXZtU0RQb3c9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30afbea0-a738-4a2d-8990-08deb6914a2b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR19MB6736.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 17:00:27.2847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR19MB9625
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[outlook.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[outlook.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108869-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[outlook.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[george.moussalem@outlook.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[outlook.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,outlook.com:email,outlook.com:dkim,SN7PR19MB6736.namprd19.prod.outlook.com:mid]
X-Rspamd-Queue-Id: 36A8659574F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/20/26 20:18, Dmitry Baryshkov wrote:
> On Tue, May 19, 2026 at 09:56:06AM +0400, George Moussalem via B4 Relay wrote:
>> From: George Moussalem <george.moussalem@outlook.com>
>>
>> The correct CMN PLL reference clock rate for IPQ5018 is 4.8 GHz.
>>
>> The CMN PLL driver did not account for the ref clock divider which is 2
>> for IPQ5018. Therefore, the computed rate was twice the actual output.
>>
>> With the driver now accounting for the CMN PLL reference clock
>> divider (commit: 88c543fff756), set the correct reference clock rate.
>>
>> Fixes: c006b249c544 ("arm64: dts: ipq5018: Add CMN PLL node")
>>
>> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> 
> There should be no empty lines between tags.

thanks, will send an updated v2.
> 
>> ---
>>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 

Best regards,
George


