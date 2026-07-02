Return-Path: <linux-arm-msm+bounces-116047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mMDQHQB1Rmq0VgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:26:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EA26F8DC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 16:26:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bbIIBqLm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=RyvLGkWW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116047-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116047-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F3143300B831
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 14:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE8264A13BF;
	Thu,  2 Jul 2026 14:21:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAC3283FDD
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 14:21:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783002092; cv=none; b=nOvsfJBqUMtAzM47g2jVbDVjAyeS9ZVDGq/NhfM5126acRJ9PRzhkX0gOGxg4xTahU2iz7rlJ6RCPoXDkDz/nSh9JgFLWPwfmzyEZbCkxLyS8RQwPeoK0exBlDMrFDGsBURDt/4Ewk4UT+JoyXszeJ6dCS1wHqS+LscDDcghlQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783002092; c=relaxed/simple;
	bh=MPs05alcI5kyt2xMxJXFLxjTmV0pdLFe+NT8Mu8MLT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZXHOpvh8S1kj2BDF/vew3wgP741qQwYIHKunB+fJK/wmD4wL3r42gTHDwv2vzvzsEyBow8GmyG9Sk5ePo3fhLtGUvEOJeDSonSeQ/MXgG0JrIAk265bYWt4XN+ROc+BKwM/WO1tUnywyyEJS0CE9WYE/XB32SXZ/PttpDv2i2nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbIIBqLm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyvLGkWW; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3O9H647248
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 14:21:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MqVtWXYMTfvzhL7PG+gnIDmu
	Na4x7hH2EKxmHvzclx8=; b=bbIIBqLma4/I95h4vPOsI+Q4NmwkE7LEAE9tPxh2
	yVUSMUlAoYZ1zVV3uuXiS8Gy+XhSCbTi/mWrD1cUZ33SVM+eGcNGQAFNv6Vw1CRB
	hlRmXKwSPn4oQVccVd0tFN49S9zFnrCUEAvJUHtfXc2LNOGv32tG0jIp51lu8ZXG
	+TgHyVZiHDP7iyaylM+mnTh44sWguTwew/6vxg1EplRfa1+CQRPZFiHcsV8pUZmE
	eEXkS70XC0aooLoeffvZRSgYQDMCmCQsWbPwFFF9YEItrWIQA8Zo/mluaFw+BFqI
	EzH9rzVEs6m98utB3sKWXijtxGamgGERydscFflP0aID9Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5gmb2a5f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 14:21:30 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ab02fb3054so643061e0c.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 07:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783002090; x=1783606890; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MqVtWXYMTfvzhL7PG+gnIDmuNa4x7hH2EKxmHvzclx8=;
        b=RyvLGkWW8DXn3c/l/3nRPjkku+iSDYiEUVbKHVzenVXzghp6vCu8QxgMWBP2Hm5usE
         O2Tp9N/i+JyKmL9O5obvbZKONYY9s42U4NCmGBoePvf3nVvu9+MhXsquKcH/LDhlx+Da
         PZZhFDNq/JqkuUgu/Ppo2ve+0u9Bo+7EtIZmjV+FWpOtx96GQHAD693xxxCLXU8xpT4H
         +IAVHWrVzLrGV8c5ZdzbldU4oGbESGzdMpE76IFYmt7rukJKzV3qmP2lv46YICwuQiz8
         mGyEf7e+pwi0B9AUHgRPn0/otH3V+3+ANvsxY+w34IUt36gNVBHAkLIc/TEJ1jt/R6QT
         n4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783002090; x=1783606890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqVtWXYMTfvzhL7PG+gnIDmuNa4x7hH2EKxmHvzclx8=;
        b=OBH3d1WwuJtQiJeF5MSEDEzVoPxAigbMNCj6BXGyzYZOmWI6ChbXlWLWyDYEtucSbr
         fNTMiW09UD33K04IBLjqTac+mXdFVhMZaGNTY6t9ibFHYBsbgd8P27jMghXg4hMqNW81
         wmXIr+hYl39TScbC/G9rrCIHHrtx7dTv1y4wFU+A9NEm47t4Oanf/EMNIpekFK0HwMdW
         qUOlHh9ceb45hY5GrwqHkNcfjjMJhrmzpg2isxY6maBP3nR87gdMQWZHEEGpI5zUvrBr
         DpLns1gncKbRjImc2YbO3+zBcV8dsfp7PGxFh+mPUsCdDmiDkicLVDqDESgjO3ysU5g8
         ghDA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/kctzZ7RXHkcc92lqS06xugvboOFDeGkxSzj3nvMvS4MGZQwN20oS4x3qaqUrfotj0UDWVg6omxlpIMnb@vger.kernel.org
X-Gm-Message-State: AOJu0YxNV8r9R9jlDxFM+kkMCGjIwezE4V+ulqRnhS1dnfJQiDcQZIuG
	TIWtQTysFQpWTfFQtrw4LStk5+9YHUP42NRWIXnzaaHqpbtXpxSW/ZAONfHS8apsmK5xlUjtViQ
	ZJykPIweTwGvpgrXkryGXVjLyIIYfxyebVTKPpCprEyPEcDXyXpBWOjRdd0aXrwlkOeug
X-Gm-Gg: AfdE7clZHAHd6kzepjZsf9oTZzjVi9DhqBbmVUqwzngoYqavU/g6yNLgkqZ6GIaHjgB
	iUdcNaswlqPpIg4RNd8JrGNx8k7gZA21S/+ATZKdDYlApdxu/Tg32cgHq/8Ua4omlwkNMI6QyZH
	CQshM2tsjAFb0Q8QwN0674RmrVmere8VPf8diiNnHf5ipxz+rlK/AEuuFlbqIC0Q8QSNCGmpYIO
	FTA86l1Rh/P8lGq9k8ypAaXN+S6YFoTF+77R0oVC5OR/BXOLQpQVVrNkruhkGoYbrSKZxn/+jrH
	A7i+IxQ3XHSeUiZVkXt7KEFHIzJxDD2mvTT4LOMNDh0ozdo+PTouRUbsWmm2LI8OXN2DtvtXa9R
	kzGhHo6F2TTBFqeFAN4pSO8iOzMnw4YJahdj7V5S2mbcik3RXgMBjwZaYDQ+lNEsihTSXhT/4DS
	Q1zexoZ1w5bnZjCoab/jjgk5X3
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr1966165e0c.11.1783002089933;
        Thu, 02 Jul 2026 07:21:29 -0700 (PDT)
X-Received: by 2002:a05:6122:e1b2:b0:5a0:370:f12c with SMTP id 71dfb90a1353d-5bde3b0e0f1mr1966141e0c.11.1783002089444;
        Thu, 02 Jul 2026 07:21:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89dbbdesm707197e87.60.2026.07.02.07.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:21:27 -0700 (PDT)
Date: Thu, 2 Jul 2026 17:21:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: monaco-arduino-monza: microcontroller
 LEDs
Message-ID: <55xdfva5yytsdfk2gy4fyjnhoiekqrew7c7i6ag424ltn44tgw@vdgthslyf6fi>
References: <20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com>
 <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701-monza-leds-v2-3-c1be0b472926@oss.qualcomm.com>
X-Proofpoint-GUID: MQgKTdNkCNf361NJE_i-r2Ik_4Gef1O2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE1MCBTYWx0ZWRfX0zVLG1zOXv73
 QECMVc6Y/4mr6tPWQExJvM/44KO6BQtGdkt9K4OPO8jzhEhDHSSprf+XOrDlr50a1gQsqZLhF4j
 lUXl5rayi0il+7dF+cts54hBHKM8CDM=
X-Authority-Analysis: v=2.4 cv=aJ7Ab79m c=1 sm=1 tr=0 ts=6a4673ea cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=F2uzNt_Jvis__oCUEkcA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE1MCBTYWx0ZWRfXyV2jx1gCD0/D
 olh2jsyKDuiSdYYdF1z0XwE+EHFKHTgcp51emXhGUUoM/VFy3N3TuxMTON/6umMvDgPfHVNEQVF
 x0feXhGQS5cFjtgyZRu1vhEgr4hNO9tCYSNaPLm+UBN/G7Octmj5omMbSVTIp3NN5QiMDiZsHGh
 Tq3D2668ZtlipX8h0GIpssyXRXLv+MbFZOvYESpBn4useO+1TRS5zxE2U7LOcYAlPSMXfQFlfqt
 9B2iS3a4w/9rODUNPCXmZ6qfFWLgXkaMTgD3l/ZS3uBlZvAsvh9ueJlsfwDd80DVmDWkdUnHIwW
 LViHoExbVWqYm8DmQoeGA7aI1kLRKxwwsNcsEGZ2ukZ0LQ07KYahwDi3n6dIQhIT1GAtx1CzE/R
 ZNTL1fI6/HdK133TBf86WssQnrwpl4NTA05iTQe4lHY5fRh383Y/yLmn2bx7Wbo2UUXfulHd88l
 q8p4znjHr0vh4AbhHLQ==
X-Proofpoint-ORIG-GUID: MQgKTdNkCNf361NJE_i-r2Ik_4Gef1O2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020150
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116047-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:loic.poulain@oss.qualcomm.com,m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 60EA26F8DC2

On Wed, Jul 01, 2026 at 06:15:53PM +0200, Loic Poulain wrote:
> Onboard MCU/STM32 implements a led controller compatible with PCA9635.
> There are four RGB LEDs controlled via channels 0-2, 3-5, 6-8 and 9-11.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 110 ++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

