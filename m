Return-Path: <linux-arm-msm+bounces-99821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALF5G8mzw2litgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:07:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E1A322A7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:07:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57D78300D757
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B73EC3A7846;
	Wed, 25 Mar 2026 10:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dz8Ko6kn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CBaZf4R1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648963A759E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433203; cv=none; b=NEAZz7niq7uoa5Eh9EY+yKRqE5vDHbjIn8mew2MG53zwPEG7FNmV/LZT4CVPuw5AOHm6JlWEU9evuUYbGUgKs02QxAY7GZld/0kX9wGi7u7/dCdM+6vpyUU2tC0rF8f+iKU6qyDWKBNiMq03WgxTXuknAnuFRoqUi1/HHlScdy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433203; c=relaxed/simple;
	bh=FnGhva3VyWYjAiPFj4WmMzEhTuNr7D+Lwl2bX1/UrCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLPNoSoFeBDQjm0QjEMZiMf0EixkgLQcrjkIFtNbS+DuvCI/2sYrnAcpYH3keZuy7CEA8GlPOvI3PqRiaUCp99nqcbOj+sj3PEqssdXFY6lSR5rDM14v6557AhUzvJAewLKW7VWR0lWeH9qgHf7sXmisnFaUmFOrVkPTLEG5VXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dz8Ko6kn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CBaZf4R1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P7E4pm3420001
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DnteZYl88WE+xcRRZ01bTxWYQKD074y9Yod+8fGCm+o=; b=Dz8Ko6knMLo/PGKQ
	4CCNrJOnlMTeKsS5AfzgIjxPZOVJEQdM220xgUU585JfTkzEJuBraDxun7AB6e2X
	5lIxOFDs9lanGL4/UevtERKpCPg4NL6+CE4g1slMEgiMFo3tQ0zf6Lmb3cjtP64W
	bLyghq66Yxh8OP/2ejTz/3uJNaSNIJBF8Z7IkI7UNlwys740OnJjAxqnA32jP9nB
	oE7VEV4h2gUOyI1HYI25ACdSsNqTY9RMBY7aGs9MaE0KWwv0oJLKbNkrlsP4vl1q
	167zCF6hONgcfXdBA1wJnuv+IxVVUhCEqr3/YWjNt75cxZ47+r9/yUlPfvUdVx9V
	m6ralg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d40f4jnay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:06:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c471045c9so34474496d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774433201; x=1775038001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DnteZYl88WE+xcRRZ01bTxWYQKD074y9Yod+8fGCm+o=;
        b=CBaZf4R1IEUMYO53jKC6DZmwacNVqoGFl32t1oJo41Hh+zOIEPrVcmGSXecaJecrou
         SZ3wTVZd/30qTFiTftcMgO0wHJGHGn9DiGg3sv6LYOgg8NwN4xwqMvuIKZpOGSeKdbE5
         fc/P7O8Kidfvvf2OXlK8Hzj0kcttNxPpbLxtpa+73AG5zoJfdfr4SpUvKaNqE21d2T0B
         s7Hzmv4bFanmLHkfjsMzIUlVGoHcT7Lbm+uyhtDoyW1UNS9nTtbumSHvB4DJuaufnUDj
         V5XPEBaY9atirTWPl7ILGUu5a9T1k1IyjLcOftRUnGx3JAUsQFdGPdpRj61LOIale4Fp
         VRTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433201; x=1775038001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnteZYl88WE+xcRRZ01bTxWYQKD074y9Yod+8fGCm+o=;
        b=fZblqxKMPubBz1UWxNRw0T9ufDivNXNDqVDl3eRQvxHZjSIpvYVqGDfYyY3APiJuGc
         imIy6r0r0aopFb2pwpzCbGAdJjUJqskUcTY5P6sRjcWjM21JNytFsY9ApTZlEQPURQyH
         BAR4NAS7OrDBdugWQ+HSfW1Ufm/veoFPGl/sL2Nfa+ssqHy8fzE8Nhf48zlscBXxg7HZ
         3owpOk7vLXT8Ersg8SWqikT+TjW9nGcxgBDskIDtGNvu2SfNnkLRZvCep1v5uKKrzl7p
         QRVL8NMsnXW4SwuMgtEO2UHwX/eJVVckoe7DRGuv3113jJCOhM5aEUsYfyJst2YOjGBg
         evJg==
X-Gm-Message-State: AOJu0Ywov5XairGTrfFOm9yVyUWOrzxUWHz8kc3lOJwbTzBr4QDCk4Fq
	PZfP6qCYVXOM6uWym4mCHg7HZXiVgRBrw0WfG1//lW1l2ZmhU20ce0vyC1ID12sJLIPGrmI3HE+
	BJ1Uomqr28jTbr9xi6pb0w/xhzFQNxd5s5efmB0o1wLAysv/bBN706QMd0Mmqpq1tL42C
X-Gm-Gg: ATEYQzx/GPGr4Z0G8X+YQxoNcrdZpk/nQgGMCLfzzLrbj+1skbkz8bJwG7jSzInJifj
	JYhpWasbI4AE0VkYrWhWmvcB4ZmgtBMs3xGrk5NBjLP8v4jOK9TI551jD/jpK6sGCpCdjGFeapy
	lK53dCXlxCPUBHuwrDdkGaTu6dvVODWIZfJ34e8D/OpqDGnh0vOEolqxcbZTsNKj9urKwA6s2h7
	AoAz21SkBoN+VtuMWlQCtD/XOlCUuBpdGE3ILO9WIOHjjDh2teW8VuSRCKU5P6cqLZq3G2wiFmC
	n2tjWFeKV/LsGBYFpDEPRxgc70K+M5USXLtuEcBi/tQp9HxIrExql0t2LGgadPbAc9PC70GmT5G
	yAJ53p2+R+4n5QxUJVu64rQO29ChfDKWr+DnF0porAVcV0fFASf+i7q1lOt4MX4eZj49wE13Jbe
	37xY0=
X-Received: by 2002:a05:6214:29e8:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89cc4aeabf6mr32763986d6.5.1774433200693;
        Wed, 25 Mar 2026 03:06:40 -0700 (PDT)
X-Received: by 2002:a05:6214:29e8:b0:89a:7d14:66cb with SMTP id 6a1803df08f44-89cc4aeabf6mr32763496d6.5.1774433200099;
        Wed, 25 Mar 2026 03:06:40 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b98b20c8c7bsm187771166b.63.2026.03.25.03.06.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:06:38 -0700 (PDT)
Message-ID: <c55d6b2f-c849-46fb-90e5-28c5bbb369f0@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:06:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/mdp5: drop single flush support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260325-mdp5-drop-single-flush-v1-1-862a38b4d2ec@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-mdp5-drop-single-flush-v1-1-862a38b4d2ec@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MSBTYWx0ZWRfX60mzlx5EnQV2
 ACkJiER5FXrAsYy8s3pSlgj4gwo3tWMYzoAJRAUAExwQQ9z2ilCpFFlQrMnVLnoz27TmcEXcf7h
 XOkbJaM9SxR0136wXoSE/kO8B0ZPZFkHnMq/A0ihu5JqjBZJAkcqpVJQpI9FH0x37UTwssuZ0DI
 3tEhagUzSPpUOEIFJz8Zfz4na/W/7Hv/mwzU8rqRVDYP6cKTUdREc24t4xtgh4VTnidKmFKozSk
 nUcPTdIfMGQXYlWpFVJDf1NXxzGh94xyOnA4oZwzZcBQS07+39fACfhdBdSe3MvHekzgcIPUiav
 4Bw8tRyfgV9qjWB7w3aDHBTegflUVR2+WOqdvj9eUUJFen7PP71pbCsGWR4c2cPmAbxC46HNmSF
 wBWR+kLi6hyYZQH48Y0Ku7S0qh+P/1QCGIRzzAgpGK+waH3e25HXPtFkoXks9lSZjf9jmTCchLP
 UNHJrSS00TbwH2lRhqQ==
X-Proofpoint-ORIG-GUID: bN__lRBaUjteMedmYrjkK_afCKurp72e
X-Authority-Analysis: v=2.4 cv=Cd8FJbrl c=1 sm=1 tr=0 ts=69c3b3b1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KHC-20qT3CjjWnE2qcMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: bN__lRBaUjteMedmYrjkK_afCKurp72e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250071
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99821-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 69E1A322A7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 3:59 AM, Dmitry Baryshkov wrote:
> Support for using a single CTL for flushing both interfaces was not in
> use since the MDP5 driver dropped support for dual DSI configurations in
> the commit df3c7899946c ("drm/msm/mdp5: drop split display support").
> Having the MDP 3.x support migrated to the DPU driver the single CTL
> flush is applicable to the platforms suspproted by the MDP5 driver. Drop
          ^ "no longer"?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

