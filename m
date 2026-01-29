Return-Path: <linux-arm-msm+bounces-91094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPOxBGesemmv9AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:40:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E93EAA4A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 01:40:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02C29303011F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 00:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E94B24729A;
	Thu, 29 Jan 2026 00:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQtZnnRa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCSmU3aT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5044B243964
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769647129; cv=none; b=OODlqF36FcJ+fJufx+6PznAK68NjSq6o3ammbm768XlnpGs1Ao3rLlnlVDymf9JMoez1LiAYSZm32OmAZSNXLcDblVsHQHirUFNpuzi34Ppv5FETOsGUEmqTm4U65Xq6tZWJ4AieMl/kPzXcWHGha8fH7lXfr54iD7/pn/lxY/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769647129; c=relaxed/simple;
	bh=tFGohcXNB1VrbcpvhBb1VEtLIE/4EsHR7WJmt5fou08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atFbPBoHM784xixdEvGkuHdJRvHhJlvWX+CdUgcT9Zn4LcbykH3cS+AhEe4gUX4eapxalIwNVP/9IM3bHl6d5rmseXpDcN+nOJlreOZTyO5S5aRGHSHMqjxXukV1VT8q9Tnc5Qp4lVMQIb23rBJNfQMrF8HhZ1pGFn+SkgaYviw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQtZnnRa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCSmU3aT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SLpAo21398137
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:38:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TbSqA207/UiHc7fl7C8EPRZ8
	omtomNhZDirOcZgI6nI=; b=TQtZnnRa0rbOy9IOQF8gnN4Re+tT6AiYzGdRxFQt
	FOyO35aHOD3CJUieKbIu+7uwRpe6tyB4ob1SaN+1FO5VjyBQl8sXrdch2SSFcHiq
	w2ExKy8sUF7psjPK205C/LwPkDzq+QitgtY5PC8TJDvivLnMjksPcbPSzTVrF3bl
	CIhUB6sC5bpUqIn4eUQXnsaeJ5KMRJYF0U91J+3JxxR6SYoBUv606SIzGQ5djznd
	JyUrJpHZnb6jQY2loWJXeuZ8m8RZC25dgfcua9ZWyz9DUarvr/k4QH3D0eMoPR72
	cdcKxRziVrRfcq8J+VoLL00nRVfRw3Th29Z8kw5GpjVTUg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bytqy0cgw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 00:38:47 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5634ecb51a2so391276e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 16:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769647127; x=1770251927; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TbSqA207/UiHc7fl7C8EPRZ8omtomNhZDirOcZgI6nI=;
        b=jCSmU3aTcZGlMSEzWFljvAEwTaP1Rk6RXvLhyo5z0TrwY8kHiB+9Npt/gPQo3Iui7t
         J+RGPxO+hCAVDGTdh8w9eYakPz8gKrZ7c/IlzRnmBg5EwosW9OCCBeF1iNh4OD2fMo2l
         CL1O8gWbH8J9HmboGAe4ZS1/ip0gt3o2n+2ddZp/lv8G0qpDU5TVs4hw8r7iYEl+Paut
         w+iQfaVUmFewjy+k5/vr3KEwMiUrFa3eG+ZpYqT+BWvwpb2Uz29EAQ06C4cUxjYmzBQU
         01LE7DRDC2O+XBAF200K9MsP+Qge39IlVDpwE0HYLdpWAinIHR4LRJJs6APh4yA2oE/Q
         Ml8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769647127; x=1770251927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TbSqA207/UiHc7fl7C8EPRZ8omtomNhZDirOcZgI6nI=;
        b=SRDF5WR5aQ+wMr8/VzW0iiINNkN3Dq3BzqCYOn7qZluW4scx7EfZQGySWwAi0MEFJT
         kT9uaFIoMH69a4m8u1mpUQZBDRyFnn8eFnETkMFs90/YonjtW2d6Q6dsToxBBbijpTv/
         FfXWCPEog99yA/m9ujpWYw7RBiuzNbF1++OqznTcYOgI9EZ8Rym1ospQBoO7GEBK0wE1
         pmmfFKG/bEw4UDY9/y01SgDeplBtmnWnNbeDq8PGvwAWdncVzluEY3hNW7/FrrDLHqzt
         fmlhbvRWJpLk+qpAP8r/wrzbEEK0P0HDKFRAaI5un0VDtsoK/VAj/iISEkbQ8gGPDzXi
         EQEg==
X-Forwarded-Encrypted: i=1; AJvYcCUFN6gwWGaB37/7Z/0UEoyqz8hriWWXr+3wYqF7q36WF/ZSqrpXwXVQjm5eJv+RPIdvWNuVsusogTs4g+6v@vger.kernel.org
X-Gm-Message-State: AOJu0Yymt2ffOiw9MJNW1jnCu9+k1BndxUVRBOb9n9+u+FGm22swFKAG
	ZgqwBHlh0amKijYymmYjSsmOsofaBaKOcFpXZcuoA+OCjucmRKO6r4JBt1LWv3gZqcvG8dLkG7r
	rqpXCILXb6pwocKEHYtTis5BPHnRnviUahZu/2R3/DJnuMymYo2ZzyNJljExBgEECbffv
X-Gm-Gg: AZuq6aJ5gTfhK/0bJJt9Dno4TCCU/a4fvzdyx2O6Dc+YWfotbqiebSrtLxW0dvC2dAi
	egZapmE6TVQiniGOkno3ziRhdivHdRUJAsuE0ApchV3bAiLIehpYUBpvq8V0HTULvLSJmdHdqal
	2k88kXRQp2Szw2IvsFTlyQ768ygU2wbAuyD80rC5fN9OuSzhQU8n8wH6RLEpAVU3oRJZeFGEVWj
	Fqu+UJ7we6axmc0aIU+ppS9QvU4de9eLJmRBpIOs/UFcazsb70XeLZb1seVIKPU97KWgXLQq9Ut
	dkcMorAXWuZShdcJXXOt5BqZMlc46OxSAtoQ2ZuRjY4b2Z010yX7LlrQs3SgJKMydnlncgPUxiA
	BkJBtQISuKzzT4emM6vH2g+8fMf/4dCZLC3/xrEcICD68P1pDBgLmhDx+fB6Sm6x3ehsqU95NTb
	DaDj3QAt2A08l2vB6lYYzfE1Y=
X-Received: by 2002:a05:6102:50a7:b0:5dd:89af:459b with SMTP id ada2fe7eead31-5f7235d7477mr1930057137.7.1769647126619;
        Wed, 28 Jan 2026 16:38:46 -0800 (PST)
X-Received: by 2002:a05:6102:50a7:b0:5dd:89af:459b with SMTP id ada2fe7eead31-5f7235d7477mr1930042137.7.1769647126178;
        Wed, 28 Jan 2026 16:38:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e0748993esm836048e87.37.2026.01.28.16.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 16:38:45 -0800 (PST)
Date: Thu, 29 Jan 2026 02:38:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] clk: qcom: camcc-x1e80100: Add support for camera
 QDSS debug clocks
Message-ID: <jzg34rsfxoqsrwrkls5dd5l4zereziws2hdtkvotpogwmmbicw@ludqwpxbfp6n>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-purwa-videocc-camcc-v1-4-b23de57df5ba@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAwMiBTYWx0ZWRfX+7wGNIdvM8Z0
 V1ONtH6cTXSYqoUmo9OHAdZmjif4vuJCYBqviNNtPabuhXFAqnyJZbuVoRzFHl/Kfa0H+5Na3HC
 CsBZ1qPg7GTBFtr2xSvjKocodFMlM3S69EX/IHaQpxierkivoyztOHTAtyjCHRqBuzeO9rUEyNN
 1gHmHIzfbHiEWqraZt4TdcPYySS24T3KwMg4e4nZ1IhTR/q9o5Coeo3Tfp4pJrpDTSg8I8UwrK8
 7QlPmqmtx/q/I5lhqeAXXSCGgkNCUCV9hueANgq//ZEfLb6VNmuE3CLxpHX+CEz+YIss/zMeKJq
 qpM2L2QyLCZoY7iaNBJIc9F2fh6oJPO4HDzWnHvKk/LVWT71muWcoYKHOR/mJ0aMeX4SwEsG/SX
 HqjVN92TFThxBaNkk+Swl3MgOZTcByuAb8DF5yiaUnplrUDsUDIjlbgF6d3u4xvrzLOYFEGt3PD
 vkuvak8tXQnNra+ZjCQ==
X-Authority-Analysis: v=2.4 cv=Je2xbEKV c=1 sm=1 tr=0 ts=697aac17 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=80PgSMyzE0h40E604UEA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: CDt50_LQiA3Fkp8SQA8L2CUeUR3eDzy4
X-Proofpoint-GUID: CDt50_LQiA3Fkp8SQA8L2CUeUR3eDzy4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290002
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91094-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6E93EAA4A9
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 12:56:35AM +0530, Jagadeesh Kona wrote:
> Add support for camera QDSS debug clocks on X1E80100 platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/camcc-x1e80100.c | 64 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)

My memory might be wrong, but wasn't there an issue with those clocks
being not available by default?

-- 
With best wishes
Dmitry

