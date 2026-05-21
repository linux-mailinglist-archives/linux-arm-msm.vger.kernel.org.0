Return-Path: <linux-arm-msm+bounces-108975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIO0CeTLDmpoCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:09:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B825A1F2D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 52F3B30AB185
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 08:55:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1335362156;
	Thu, 21 May 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/GKHuJO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xnm4xU9L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62FC30FC34
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353680; cv=none; b=StltfcKrV9HIdW3WNcjCDfgXFoZFBBjlc0b7DmSGF0+0mmKd0JzG8CQD82lcHgTYoG2iIln9eoxc661+UDrae52nq7vf/lJaZMbsujdY6tCouuwMna7jsk/83RIz0/8AhHxzJ6IqSQFDuPbMtmCEXr4NJg/zclPHiRBuOiE3K+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353680; c=relaxed/simple;
	bh=UXSoyOzUcwtpZz17TlJjAUrPbDYCPmyHiRdYez+lk3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gcvseY1hFe0mo6SM/Q7kiCB03lnLTnU18vWA9D1+Pfk8qImLP+wGJcdtJlH2URQM1pSrFdPgQzpFrdMIwiYbER+H0wNT+4ZqEjKJDHCcVliqq7MMDMoadxUxOy6VnBxyHEGYwtSuAFPn8DayetLA5mkDZZtNRx2CsiF7h0CnMtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/GKHuJO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xnm4xU9L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L8MECU748388
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7KneU25sMeS+sXuch2Vow90gK/BMf+EqfUeuRaPhtrQ=; b=d/GKHuJOcJy9aAq9
	FBVantGqilVVHL0saJSTV+k7LN6lLwK0JOU2gZ96QsgGhWEBN6oMGy6vBZMyxY1J
	/PTZUiZzJ+f4D0/au4+EWasMAfdEecBwmflhz+unCszt10qRkwtLjvUAYiZp/0lm
	e5NpYJOe4ZE7Z41RTsD7hP/7sqFRrqLzuvIvKA1lM95f3efj5IpfoZxWEKI0ZrN/
	7OGR6p9TvR9hIjgn/1jMD0LRl0YxALRAYT+0tdRYwsoCGCwKov6pFFoc4M2eKJvw
	7Q3L4cmF8qWXqvx+Ff65XBrmfEZynlT6lKdsf0HAPJcW7MSnDsiux1PcLVz0f1i3
	D7EpGA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kmtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 08:54:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-90f5edb7516so135973885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779353678; x=1779958478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7KneU25sMeS+sXuch2Vow90gK/BMf+EqfUeuRaPhtrQ=;
        b=Xnm4xU9LTfIAc+wuCBMN67SSt4qOJsKtgNVUbFPaZlmEGAJwXBgehm13tRsNHSOD3m
         9zLUu6c/PHm+Mx0m/CCFrv4y/T+FWceUZbZ1xxvT2cy31TeVbAfj61tZhMmQ2yyXLn59
         HiKmxqRLazaypj+KzBeEMHemUpZb1zE/GNha/QEqy5b30Veacx9na1Tx/5nOqTSP+4tZ
         qXCG1Cpx9ThG/4HmZ2TPK3sHHkuDoqfHlwGmQHOFs5hUSaUiUi5dBEgGxde4AZI9EabC
         b8bOckFISiXTcw/zKgnY8cLYQZtygDweIy+bv5F7FUh7CbD20vP+SPSM+6oWc7tHz7+n
         FNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779353678; x=1779958478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KneU25sMeS+sXuch2Vow90gK/BMf+EqfUeuRaPhtrQ=;
        b=qSH6i8vvQLjP3oxwm/apMeyQAuOD4txL0MVZVTsKCD2EOuRCyQ2mlgdGwdD8RTY0Wv
         4T+BtlE/BZj4RDY6iL4Dct4qtVxfSvMqUbMYkAx1LKaodz6qvjxZ1LNDOa22bcphnx88
         fVq5Pbme1nSz77D2L3Efsmy0Y7cz842GIJgtnV+c0Z9pgoSL7anTdIP59puvcohMPnre
         9lvghIIT3P3UqKewW/kZNBQy/t6e7wvgjkX9Kyav0GKnlhzPCZBqvzw9c1WpJqr9EY7K
         57gAYDCpz9G6IiFVG0QZwF1+1JIE1ZFE6vlixC6dG4tajts1VtJ3xchNnGPHuqukbPKj
         EpUg==
X-Forwarded-Encrypted: i=1; AFNElJ+6o8wPAm+2brdpXv4/AtjJvMShKROCsLkxiTjFTKNTfF4/BXoT+diHmk4eYQCVMEWxWC3Y6FbOb2WkpZ+U@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKmiABBZDtZ6AlA8/1wwKGsxRpwTPwJjywrcSqAeFmiEdtPyu
	d4JU3pNqQdxH6r6GDD7JJJcgYVLSYZaYp8QqW8ANCBLxpsEXcYBtt6M/geRNd1D3qN6WgNGaME6
	Pq0ZTh6totFidzFS/nTKF6OQRW9DoEs8A1PVsLDSEuxF+r0aRYXS3JJjUGI5H8C30Ja8j
X-Gm-Gg: Acq92OHaWOR5+Io6bVDL+tHA+IaRPnFIn+BsH71uy63gxX9d3TIDBRFAAIl5EURy+Bi
	qJjyBZyBvDGLu0MZKNhFytUeyqBKgyZN0UZUOsnW5KKRcNskOT+qmKw//egvpXBb+O28fty1Vof
	g1eC4Wxxk8sCUXW0QwliylgC9cTbfeL8eOqBYjEDwPAYV+vngu8OfDxUwmv12LQ1KbDgHuuSrEi
	LAA9VwREXvVPqUXsuTmZ+3pRNypWDZnvvHYroIFfac1tm3/WEjRcn9T9tNJWJ6VLdG6a44HhEGP
	W8CN1iZpD6ZvFbtGIYft372nP8X35SbPLwo3eytAxx6hsCpBadSbIylDsyCbRNcXc3Luz3UEprH
	0zzqqMEOpZ5jjzGKygtbskLhWMax0wtLWQiUV4bGSzBnzb2M/sD2VH88rn2ruF+vedM8uOaV8rV
	+8ntI=
X-Received: by 2002:a05:620a:198e:b0:902:daaf:22cd with SMTP id af79cd13be357-914a28e7ed6mr175366185a.0.1779353678070;
        Thu, 21 May 2026 01:54:38 -0700 (PDT)
X-Received: by 2002:a05:620a:198e:b0:902:daaf:22cd with SMTP id af79cd13be357-914a28e7ed6mr175363285a.0.1779353677649;
        Thu, 21 May 2026 01:54:37 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8aa03d4asm17888266b.47.2026.05.21.01.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 01:54:36 -0700 (PDT)
Message-ID: <1182d92f-f43a-4a9e-8659-3eaa5a484c9a@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:54:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sc8280xp-arcata: Add lid switch
To: jerome.debretagne@gmail.com, Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20260520-surface-sp9-5g-for-next-v1-0-9df52552bf87@gmail.com>
 <20260520-surface-sp9-5g-for-next-v1-8-9df52552bf87@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-surface-sp9-5g-for-next-v1-8-9df52552bf87@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ec84f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=S3QPRrZGCkirkA1mjOoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 9whWg4mATBaECqbtTmnpGJRjunVhGtEg
X-Proofpoint-GUID: 9whWg4mATBaECqbtTmnpGJRjunVhGtEg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4NiBTYWx0ZWRfX3w7uVfApeRof
 00hyeHoCtSKWlledYu9yNJG2yjaGrBFyTI9fqGaaX0NBt0K0Bk69JX9CKdX6gbME7eQ+xFoYFeT
 S+Aew7aqWGjselDLMzrs8hmx+U2EZOHRx8GmPPYR9jyHY5sWij+tW6W5S0UugUipLNMA22oDBSU
 bcfteLB4Zo0pjW9N8PWrRwLpJ8flcOdX5WHE3TD9oWCLb9FHug0qi0DxukhnRsKqiNbWAOdQPQ8
 R/ADGm7NZS6MJjKGt4qmB/P7hHugeHJkWtUCmp33C8yo5HkrInasRlP1oIyuEA0Ex2MudsYyq+8
 WEvFSiN3HKmLl0d4OaJih306n5B+Sk9oHmIbLd6CAWTB5v77OL43QaQujT8qO3Ze07TZZClUM0P
 bisnE1BxNI31gOSGusUkhnGuuF5nGqMlb4ILFhY9ZEvPCpt2j4PEBeRPuSWCUD9Lq7K3dLtoLtb
 bjDky7VWXIX1A2/ajvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210086
X-Spamd-Result: default: False [0.02 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.68)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108975-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,chromium.org,linaro.org,linux.intel.com,kernel.org,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28B825A1F2D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/20/26 6:40 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Enable the lid switch for the Microsoft Surface Pro 9 5G using
> GPIO pin 180.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

