Return-Path: <linux-arm-msm+bounces-115415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id l9A8DAy4Q2rofgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115415-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:35:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E4E6E4378
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 14:35:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KKnkbgGq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fTkZyi08;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115415-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115415-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E61D23045A96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 12:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C08140B6F8;
	Tue, 30 Jun 2026 12:35:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8048C3FA5D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:35:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822907; cv=none; b=U8T4gXyOkwy/8QGy3QtntF+JCoK1Qq9LL38+N6DrpV4iiHJRY29rYkhBt196k5sKhcGuQosuft6C3Mn1b5dFegQmzvQWlnYJytMqUN1o7ZoUxWLC30CbkWbb3Ux8wNdlQbLNe8M+Bpdr17hwMhqQtBKjUotXwzuzpEm22EE8d/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822907; c=relaxed/simple;
	bh=9TD884/1eNmXF43nG6KMGGmoxZbFnZmA8KC/ejMW04w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LYaVjRQq7wxQ2aYRDBxUC1BWLWiZA0ji2K1bZeabtmrFYrgG2Rb6zsGYY7944n+zgBV/toOKqKTQI5hZ+TNglWkG5CriMB6VFTA2TyAhMVcIuW24L4+u78/6F/VPqUOYUWxWY7EaOQ8N8ZOHLQjwIno2sB+Vs2aj773vGVXHtYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKnkbgGq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fTkZyi08; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mxmt1613454
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:35:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=; b=KKnkbgGqOr6Axbi5
	m8AFO+/Jphf+KutD3yzjJBOBGMRnZBe0xFfEDCpHsmiMPqrNjMgEqDLg5As+APA1
	d8qxQEA9OWFnuHHrcNzvJN31S1kOhgBbhvh5O/v/NANPH686ogZ+A6f0Jg11XSCu
	L6oDMxUpi66Stm8pQ73m5lflpH04VKTeKA0zFa1EGW2Iuhg6ljJv0qoye7xW45Dd
	HGtzYmxnVhiXD4HqcQrgDjuP53UqQiUinbMagr+sEQrcnIqU0lXA3SKbPhm8FgXS
	fJ6ZJJDxasvRRXyPxZS1CTAR6hpiohrzlxjtTBOBierePcL5Z5NKnDlfpBqAH/vm
	wze8qg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cuv14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 12:35:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe75b7dbso2952061cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782822905; x=1783427705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=;
        b=fTkZyi08V6GwTZ86ygorNFxoRPMkH3eFEfO36sM+2I6TfgOtjmHxtMP5epbC/4kv3d
         WWzbS+609U4AxUDJCS1uDlHxUcNMIkinGsJGUHauyf3CspEf6cXZf6x/S1bumg6qEyFd
         SscAQVBi6aGKoLZYlxPbTH0oRojgYyTdHyd/ZkfrfpI2JCUYYZgetRqwUOd0F5EM/RL6
         pHeZTiT8cwr/Om39mtWYA0CH6XWhQTNXZsOBDjmAZpw3PF3VN3qYcSj2Rh+KleVsz6av
         eYl5zu3vguKNjo78QRqg48owtxhIOCLx6yFchlIDfN24rjaKSOMC79e4kqKUrWYnWoec
         xePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822905; x=1783427705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XbxXKmb6m1o+wu+br6lLzlt+6G9oYy2IEucIolB22Mg=;
        b=NtCka1efpa9MPprSWprIFI05/qU/EOfBOJUzz/YJtdaVwGne9VAQcX3URCABrlHid2
         K22gYMtIeKaoOz1B161I5/87woIjUUlhV22L0e7RkoklM21/OcIUF45RjqvgdDVdqkaN
         qsZFQ7F/tULDmlv+DyjztNzTYgQJ9h6kpdg0J8KmpNjwF2n3l4d3JQS63HZF9lV9YCpz
         hWSRMvoaCOhMcHkuOsoUF3a8qephpQ/H9aAIoQ0IJ4EY7WWRv5FV10IrD1CdgGiFDOyZ
         vCMbRGdCrZvkBl2p/tigb+CidDuZzXhUKMGYEXJ5mNW+1FutqfJ6MEl2IWRIhff1ZQCJ
         KqUA==
X-Gm-Message-State: AOJu0YxQAJFOqoToEVmCMj82BdDPUOuvT897NeQHqbT6iDCZg77tFnyv
	4Q19dpnID4G2VtRPg5fYXlqzRaHy7ecEPK7AEowoJdbAbVLk3ZPAd/ZP+XwgOlm3zbfApPLua7u
	oMyIR37n67R8otR2J+PlVyuDByC9OChIp6ltSmh+rcalA018fegEDaxSmif4s1nI9mYmY
X-Gm-Gg: AfdE7cm67NLT2b9VInm5se5CzKk8Q1eFJjFpgRdZr6jYPP/gA35dizlCrLXH4wqecPh
	wQb1I8I6ARlk/ljcVRPckOoYE0XA408rE2K7IeVUtbV0QcrDF14L3EGQDFOI8wwJGl1LBiYCPys
	AM72aUa7bkHEWBZR4T5z9Ar6UNMNzhve+e1vnJHTL3ZZzFUG05B+X30ZCHGtH/BqDbqv5O/Dr2K
	qlSLNfdJS/XvUznNPxlrM8k+0ZlFaap1nXKxZmzUrvkNnBh04mjh9k2voOxWSNEfNlxt+57VgRM
	mi0cwhsHGQHMTFf5ckogD8242TdccDGTXgzz691XlsHa3YVKJlc2u8D1yuB9iAfVbCDa/Rwx+O8
	6aF+em5CNJSiUAYSuOihHpvRG9s5STA/Bxvk=
X-Received: by 2002:a05:622a:a1a:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51c1744f08cmr12929241cf.9.1782822904825;
        Tue, 30 Jun 2026 05:35:04 -0700 (PDT)
X-Received: by 2002:a05:622a:a1a:b0:51c:1744:edf0 with SMTP id d75a77b69052e-51c1744f08cmr12928611cf.9.1782822904391;
        Tue, 30 Jun 2026 05:35:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c19esm117506266b.51.2026.06.30.05.34.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:35:03 -0700 (PDT)
Message-ID: <594cf827-819e-4262-9dff-a35c7f69f86b@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:34:59 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/14] remoteproc: qcom_q6v5_pas: Switch over to
 generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-5-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-5-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfXwa/cwo4HH7CF
 9WVVp0mBrgQWub5qAlVPCU1FGJf0OcCeEs9pRgPXRdAT1JTXL+Y8bfGUDsndhSMRmxIQG8wedS4
 Q6pH81tI+fU77dPYRymHpvMXqxnHaS3V5KDDMRF35UCCujk+VOOiyNkXyrTDesp9j4dw5qyaYcg
 zvOcM9+bdiyPVOp/mclbDq9IQS0TvG4tffD9ddaF6v1p+sL+aCdyIRdbWRLcPNWSj5AMolsz6u4
 Eg610rYUZX2PgcMFs7sTe+7rGyEiqYBS9bfJLsKFZpYhSTsarpO4aws1YWLnxKNUJ2VHV9iu9ca
 V6YvEsGzVPEmZZyXYYIMnL6R7+UP3tR1VxjXRhinzLa1V/tuiLdAfdz6DZ7agIwEdCiJRW0BV1K
 ChxVt7TM0me0YET7DdpzYaOWpySmC6QOt7eCy6Q42rOB5uYYLgTYcwqLiOkoXw7Udx+BVOnpb6M
 g2DRXQzEAKg75r5Y9TA==
X-Proofpoint-ORIG-GUID: eXW0huMC0YIIjsaXjADhwEUY4DYbCmCQ
X-Proofpoint-GUID: eXW0huMC0YIIjsaXjADhwEUY4DYbCmCQ
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43b7f9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JRhjOG_OB-XQkuSI_8oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExNiBTYWx0ZWRfX+IAK4lZPv6yE
 vX06C7LxPvlY0SjtqLrPVCruL7rFYQ2h9II3Mo3ZdnUTyu65VK+Rr7/z0l4gyzsNSPghExLDTvU
 iHDWUN7yDeaAr1IOyM/mfcogc75G+v4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[48];
	TAGGED_FROM(0.00)[bounces-115415-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sumit.garg@kernel.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-media@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath12k@lists.infradead.org,m:linux-remoteproc@vger.kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:vikash.garodia@oss.qualcomm.com,m:bod@kernel.org,m:mchehab@kernel.org,m:elder@kernel.org,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:jjohnson@kernel.org,m:mathieu.poirier@linaro.org,m:trilokkumar.soni@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:pavan.kondeti@oss.qualcomm.com,m:jorge.ramirez@oss.qual
 comm.com,m:tonyh@qti.qualcomm.com,m:vignesh.viswanathan@oss.qualcomm.com,m:srinivas.kandagatla@oss.qualcomm.com,m:amirreza.zarrabi@oss.qualcomm.com,m:jens.wiklander@linaro.org,m:op-tee@lists.trustedfirmware.org,m:apurupa@qti.qualcomm.com,m:skare@qti.qualcomm.com,m:linux-kernel@vger.kernel.org,m:sumit.garg@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5E4E6E4378

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Switch qcom_q6v5_pas client driver over to generic PAS TZ APIs. Generic PAS
> TZ service allows to support multiple TZ implementation backends like QTEE
> based SCM PAS service, OP-TEE based PAS service and any further future TZ
> backend service.
> 
> Since qcom_q6v5_pas depends on MDT loader for PAS firmware loading, it
> has to be switched over to generic PAS APIs in this commit to avoid any
> build issues.
> 
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> # Lemans
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com> # IPQ9650
> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> ---

I assume that the leftover qcom_scm_assign_mem() will be handled
in a separate effort, presumably through something like FF-A lend
on the backend

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

