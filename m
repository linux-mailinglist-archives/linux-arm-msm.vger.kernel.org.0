Return-Path: <linux-arm-msm+bounces-99414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6K0BCWy7wWm/UwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:15:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0782FE24C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 350B030379A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 22:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E76193822B7;
	Mon, 23 Mar 2026 22:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpaDkzgE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gINTp707"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60C838229A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774303933; cv=none; b=PZDBmjzXmh4STh4Z4XfcuB8ZWeaoq55J5JnGMt2Z4J1rbehSDIgsLdKH61YfjakAvSWzree2TDe1THBssy0VQx4RkVJLMtS8nf+u2lQ1xAxphSuIkZS6KAbbaEs26rJ2ku/1Uql18FLLTIprQUIRMsfdiPNPlUCdoUDj3difPiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774303933; c=relaxed/simple;
	bh=vdlFe59wdG71Wr0TcIgUqavN/rxp2PP2ViuW4n0a7Bw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw1JVU/ciqIoI71DtyeP5uj7K2ZbVV8meaA5Sz6xCUvQNTMYyvTbFVVUhAFznct8sTTGfsLhsUq8zRVQYYvUHvyjy6SIPmsomvmDZ4PWszWrYoHwlQz7dI48NhRwA/tl3zNM2tQmHWc5MLPqosY2vrH2CdrLd9g4UZO44OTct4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpaDkzgE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gINTp707; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqk2N2681228
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VULlbFstwJLC9xQhGYSDQ6Ek
	53wDkhr/lXAneX8+L4Q=; b=IpaDkzgEuuaeoDQbRmeCrx96kOPGELC4AwiXDijy
	WNC19KXhTsvM3P/ApdYLE5gri1WU2Pa6g9fAsNSe3zzpN0gBdqY8HXntabmsFQBT
	wfLCFNM/hzr4kTg9PaS7tvoajQFMCADFMpufJFUlXPIR5Jg+USVabHZZobys9dmi
	9QkB1XJrBtKhZrVF2XQ0cl7L1SRTHc9MqDgLUH8r0idz+mPXCtVfWwBE7ouCfSfE
	+maEH8oIz0VChNDsRLxE5qg/F9LqKK01CsrsQu5JGnpiNecX3PBpdr7QWVa+6iN9
	4t604olHqWXvqSddY52DPWhkWI3pBOveoi0TLxNibO0gEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31p7avkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 22:12:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b34223670so174032411cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 15:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774303931; x=1774908731; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VULlbFstwJLC9xQhGYSDQ6Ek53wDkhr/lXAneX8+L4Q=;
        b=gINTp7079NWpgiT+YMzRMfRX2j19b6MWwFePh9sU++6/tG5aCkUQIf9+bk5UHGibUw
         s019IcyyhBIAqWgOBOn7lD3Gm8XhKu1WpymZnJEpFPBZOW5vn7Vyy+ElwbDno2B/ySkf
         ioyHcNx01TgTDbIx7gFKEmwmIdPJmgA381jK/ClzB2mAWljOybtjKu5M8CXeuks/Zn1T
         icdcjjfFwvC+MTe+4iYszHGO583Cl6SuRBib+AUiReVJaxuLbOoYdUNTGxUSeRz3shle
         4AmKFBTLskzTltZM4fFz38QmE2ABvGaf9Z1OFqx5yFciX0fgCjyy6SOyI/iU/rKd9aO1
         FHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774303931; x=1774908731;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VULlbFstwJLC9xQhGYSDQ6Ek53wDkhr/lXAneX8+L4Q=;
        b=Wb7YdW/O0dIK/EgT7am7Ed8kA9MNdAfrDJeKnHgOI9uwOO3RI4hD/aNAp4VoVTQm5l
         X2Txfy0ckMbOinDz5esP1lSHJ6JhviG9JChqEnb7mrEZFb+4FYO6mGfbfoEDgxkCm6s5
         GPs8FlxAHtp6easJXeslP/TEYuSZ5KY4N33eQa5QG2UlcVLfcTppDCAFnTJWRZNZgwT5
         odL7aW5yTUTJ7B53zeJKxjEPJbFoUrWUUS6XKPngQYDz4v3PbUJv1zQCzjex7fdgOHp8
         Owds4/8nx4b+P0JNSuGcup88yXNzrzP+l3yGUpIHbYZ4vkrI/JE1o0ICSNrk8HVXxzUZ
         gNZg==
X-Forwarded-Encrypted: i=1; AJvYcCUX4xh9mb1qobnV1VHQVLiQAEQXJ23rci3k9UHuSjEfIkDJyFGzexJPs7iM5qu1dTxeTi8eAvI0bkaSYamE@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJZ8Hsl2qAtvYcfi84b/QgiaPYWv3zPJTIoIUkcxYrZFErrQx
	Uh1E8bHpwGu8TRPIxnkg7rJIHcEeT7WUvLNyjeMrePNUUrj3B8QDBfU1dcxstLl40Rsdl69ju69
	rFKSkdcZ55oW/zCdyuZGT9i54Nyf2yG2AjrVur+W4ckRKQUHNOtEMxfuyHPMOzEOzpR0O
X-Gm-Gg: ATEYQzwUq+ovJ99g0SYjKFKLIzb66KvcrfivNeoqITWvcZNyrep8h2JOdN669xjG2dc
	Kwu0G8NHy9eujrGS1W2wHNMpi+nGrSIzjCBe9+0I0A3Ll/AdIRM8b5HJsz+VlAHniw2H+/Ch1gS
	0X8CPXvaMkT9XPbVyWHgPGt90qCZmJhRAhA1Sz23PAMaXUqou7SmfZzWcJKXd9MvXDIy3yUxGAI
	NYQZBelW+OQg/vhxljnpV+w3d3gIT2i6vINRFZ0SlKnB+aGNG+vqOLeNvXqLtlFsGNdGjQClEzF
	R6b/ObzhS3HrQZXg/VDUCBgMyhGqkGa4AceiRmUQXgJw914eIUFsBcHO7v10iUtS9yzhVijNOvm
	aey3hiPWbo/PIDuUJakbyja69/lPSnsuWDtocOCC8+6xSn+nW2wiyADLuBclgH+8vwduzk638Jf
	gTWaD1dRctlL+rKRI0onrxfFe/q345aU0yt8E=
X-Received: by 2002:a05:622a:5590:b0:50b:5183:f1b4 with SMTP id d75a77b69052e-50b5183f2f6mr132415301cf.3.1774303931102;
        Mon, 23 Mar 2026 15:12:11 -0700 (PDT)
X-Received: by 2002:a05:622a:5590:b0:50b:5183:f1b4 with SMTP id d75a77b69052e-50b5183f2f6mr132414871cf.3.1774303930511;
        Mon, 23 Mar 2026 15:12:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf9982a6csm27994131fa.25.2026.03.23.15.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 15:12:08 -0700 (PDT)
Date: Tue, 24 Mar 2026 00:12:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
Message-ID: <zr65bat2eaegpuudoy7okmtazgfkubhg2w74aeomi7gxjfhtmy@bsnjg2ykiyyc>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
X-Authority-Analysis: v=2.4 cv=RMC+3oi+ c=1 sm=1 tr=0 ts=69c1babb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=WnUHuuy95XYsLch6RvQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mhf8_BGmBtwsdZp8ThSsMtRACvA0mnhz
X-Proofpoint-GUID: mhf8_BGmBtwsdZp8ThSsMtRACvA0mnhz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MyBTYWx0ZWRfXwc5cPx9hjxmp
 +9LfgaXfiu4ptkLKIZUzsRW+ibzpk25pb2YxJn2UV+moWqWFig073HNacRsAvHVHsmd1YaHbYqo
 1pmBi1McnktURICRtrDittu8g5MyHWQObz8Ra7wPw+BaB5J/hbKArwZoHReStlh5wrayYzxVCHA
 W1xmKGIlfqLEOPoIVeofrh6ibBiN9Uh1/PkQ+i7Lj8nNhuOTuNPaZvmqxiIuJdYnm8sv/K+Kcvh
 FYYNPl8ChSDPE1BeNLQ7nfUiFJDYUPzMBBxt9Fd2nApJkEnV4ws3qGLuLtw+5wW16D0sor14eSc
 s1isZ9eU5Vq6hUDdaZtNv1cYMMF+0y5zG24V0CpK8GCk4QAhh1YPp5y8aypiHZjSZtu7q+Ikv+t
 U+/BCjBzJKAZmhqFK3PN0YoQLiYBF0bAtptKkv7WH+aPH3txDtlHP0VZloke0c+jcffVNlqUiJD
 hhX5/KGoBhOTfUX5NyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230163
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99414-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F0782FE24C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>

Please switch to oss.qualcomm.com

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

