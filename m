Return-Path: <linux-arm-msm+bounces-116443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LumAG8JRSGrVowAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:20:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F177063D9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Jul 2026 02:20:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=T3jKSJzv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=czoLQwZH;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116443-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116443-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E754302AD2E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Jul 2026 00:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013F81D89EF;
	Sat,  4 Jul 2026 00:20:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07A113B5B3
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Jul 2026 00:20:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783124406; cv=none; b=qBc3888v51MNbEs5fxh85tRpt6Y/3t0N3CP490o2Hbjp/2HOy56ltoM/KwZQQesiMbBJccg5a7W7OHikGdkc5IgT+tITdHO/JycenUw9wfF+SxYGRRlhQPSu6Ho0GM0Deyl0Z484kDKpgGGqM+S4pj593PP6PyXTpldce7usnyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783124406; c=relaxed/simple;
	bh=mEQI7do9Iqc1c2gISo9LeR3usM0VDK81vCAhQqOW4qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B00A52tNdpkJdr8lMQOBofleHi5KODpbzFP8be4STYKTrXOlnd2uNX5uAwvjtG2FpXiWEfoioUzLPTx/DZMbYRfdX6StIZchcLdbucfDMXOJX0/lTWxTU0ARc1NjFTS+cC8ph77PzwTlSgfSG/YDpjgdcZ6NQDQVlOP+AJsOrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3jKSJzv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=czoLQwZH; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPLKV888305
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Jul 2026 00:20:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9lUKpFWz5PmkCzLO8fgMFrU2
	42KEVDXcNvH4yZS99Ms=; b=T3jKSJzvop/PatAb6tWlukgQlAzMR1WGzB1ciRKf
	XALPyceqZTal6YQQBv5XMQhTMc0uLqwCLkpLdEYLEy7LmlqYj+ZRipm2KzFQZYcX
	g5rCThAzM2arZXisQ1mkkocNwdX0FqRlu3i5mLgwr/5KkXRZWCk8BOVJ1plDFl2F
	iuWWnr60/dANF4IkxA3gzflFPr8TWqqglO5TkJ4Fs/g4f0QoG2B3YfqweQmEQFl8
	qkorWrtkQ49/pkdhaBvxHVEovBP03vQmCBcqRHxNt/W7v6b8EzN70fz5XI2z/uWY
	BAjIEtZi0QJ8GCNpycY/BT/bEntAageEzRxzk/oiRk4tFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f682bu9xu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Jul 2026 00:20:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e56b2b350so209455385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 17:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783124404; x=1783729204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9lUKpFWz5PmkCzLO8fgMFrU242KEVDXcNvH4yZS99Ms=;
        b=czoLQwZHiRndREDCkDVEdUhUtZ85AzgWHgmqiPgWa+uSPR55lSgFyOvC7+gR+MCebR
         2U9YtQLYxAMLxV9iN799qjePgvROTjjtEFRs8v2QcfdJCNhQ8D7iGY/BWfTbmGCngyxt
         iB6ypwQ7OZEO2InnaNes8YogszLEXRmRxHihC4nbviSHiApmWHzf2fURS+SJ09SjOEXz
         qAY2fp113hBvOmTO/N1pXsunPGacPNq3HHPCkEtARVMaMWEhqTsRU9KbQOnCeMNYzKEI
         E4EqtN1HHq/l0DlPBdjt/hmKIi6MQe9CqHr/XlKPt+qy1Owyh1Mp4RyN8NAKDBNKeoU/
         aw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783124404; x=1783729204;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9lUKpFWz5PmkCzLO8fgMFrU242KEVDXcNvH4yZS99Ms=;
        b=dul0VaUBSInIE/ivVXpUuhyH0vT0RFQt6DxodKPJrswx/Pg02tW0e4SiNu3ct+TSfo
         nzIAVradfMXvhqOyVNIW2dDt3urNOcYQlnFzEf61TzJNOIxxzcv/EKwnslOlCtk/TiXd
         U2PjOHt5g3nJhKV4CrBq197R38Y/qvEE2I7faxOMXzjC3zSNPeeWpFGS8KAkInirulwm
         2yyADXKDPkFaBJSFFXch+jRwJw8guKKH257pByU9ROCeO2Wu9P35gtqn2O+RvaUriwu9
         3GpCU9onnuHzF5xgdZhBSofRWvAY8lQP9lxJLEOc9LZn2jtvfLnZnDL9ikKJXP4Zhlge
         BLEA==
X-Forwarded-Encrypted: i=1; AFNElJ+pfjcuO0kdbl9frZqQPGzYfsx0Dh7TdRjCXOq7TmNw7Hgu52UDq07syZxW1TvgBPV4zr/mzmeq9FC4DndU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6OQC/9Qhzw8vpL+i+tqre2LokkdmdYVhnPqXnwiLs/rlL2q46
	gfAsl+E4ubSxA8S74Yx1O5k4ZL52kWYIKHnXteQL43DQjw3jemOmf1CHVRMWnK4o5SvcBvob/Ta
	5WDHlPWXxGoKWChGmr8k6EduEMiNBaPlaCxR6D/nL9centezit216dgVK58ekqONMQwYy
X-Gm-Gg: AfdE7cnE0lRsv6JK+H4Z5EKUZ3xMZ2Ikg9PqC2moOyaiJB8f57V1zYM0BYGJbaK2+ZD
	VRn3A4OFw7lkrvISyABMJWRbCJy5aU9MBWsPMs2oetgovrZYRCYFHSMLqiz7EDxa29JaRwlnAWl
	55PDBvSxdrU7yUX8F5X62i64sgZCM9NfFABDfCBt6g9C0V1d2mUmi1j7jeXO9Nng6yYpMbxzVr5
	jS7ppTjULF49bhrxCs1o8QQvXjKJGfadv8x34ASBPL/weTUf12lV52vaec5Q+XQHDaTDbj24O6S
	OeEs9GWvgUaPRqB6po4Sy9jWVLEISVh3V6z6v1c+apyFe5SfrI5u5FRhfClUwWmxoshqEfa7qTe
	+VK6V1kTqYC3fmK3JaNlUEt4nqSVLxHgP1kZ9clXnuWA94iCiQO0i7mmkIGd89Kk5AJT3dDXkIe
	xLhwq+e4p6tDvq8D3gTB2AndLQ
X-Received: by 2002:a05:620a:400b:b0:92e:6199:9fd7 with SMTP id af79cd13be357-92e9a32c2f3mr254522785a.17.1783124404027;
        Fri, 03 Jul 2026 17:20:04 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:92e:6199:9fd7 with SMTP id af79cd13be357-92e9a32c2f3mr254519085a.17.1783124403560;
        Fri, 03 Jul 2026 17:20:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13c3a0asm851485e87.71.2026.07.03.17.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 17:20:01 -0700 (PDT)
Date: Sat, 4 Jul 2026 03:19:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 11/19] clk: qcom: qcm2290: Update DISPCC and GPUCC
 GDSC *wait_val values
Message-ID: <rjrmxpuk4pajadm4ww6clq32ezpqdvivtarl6fx3t5tmigt3gg@2zqdxc5ihsob>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
 <20260703-shikra-dispcc-gpucc-v5-11-cc13826d4d5a@oss.qualcomm.com>
 <e42a2ac2-6a2e-49ca-8396-b76fd0921178@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e42a2ac2-6a2e-49ca-8396-b76fd0921178@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX01R7XHpVFrs9
 3BD/6d/yp8wJXkIn9/CjJ6mNsCbR+9Ckm7/M4UZvoCo6ULFK23d94AATvMXhOlJZz3c9EfnqUaQ
 yXzK4GKCsCmzdXxrvn1okABqj5zKBN/ak/lk54GphetLZxAnNDBXWSWCb0uR6xOuOBD5xkeBtoT
 +Jcqp6UecD7CrnLj91Z1aoZnJJoUZb50jpnQ+AxGV7lXxwyyLJPeKpvrrRcAj1Wf+zWDo4GbLN0
 Av5ZlyyGzo4DIXPszNHQgHzcgjfTeV3MqbkrYUrzY1hA8o0Jk1RJm77qDe8xiTLq/baRRaEv7IL
 q+H7MEmWe12qP/gnUYzIdkAPqG/WlI9hfmjy4HVX0qSDaJqQB0q89s4++h/bFvuQomi69dyfAuI
 UmhjzDR2H7i8B62PsPTtT6xBxEqhghACEUOBIPcxP8RrP3dUlJGgCVNgVJNlf1ZC58ksFJRKUk9
 ewR8OBAv4Nb8tcxwDdA==
X-Proofpoint-ORIG-GUID: z8pM9GqAD6h8_R1eyYwGlfswPm6jOyzu
X-Authority-Analysis: v=2.4 cv=cc3iaHDM c=1 sm=1 tr=0 ts=6a4851b5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=K2wkK-n6QBhel6Q0DccA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA0MDAwMSBTYWx0ZWRfX+ACKzL+S4ZUC
 iZAUmhKUaGkmd0QJyCUBTTSfB3vcn2jHCs8rfgPhbgVs509oAe1duXoX+RfP8nqIM7dtNjeZqN7
 3uXLfuOKHsrIxbPd0aIEf1VmbisXiy8=
X-Proofpoint-GUID: z8pM9GqAD6h8_R1eyYwGlfswPm6jOyzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607040001
X-Rspamd-Action: no action
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116443-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B3F177063D9

On Fri, Jul 03, 2026 at 09:19:30AM +0200, Konrad Dybcio wrote:
> On 7/2/26 8:31 PM, Imran Shaik wrote:
> > Update the QCM2290 DISPCC and GPUCC GDSC wait_val fields to match the
> > hardware default values. Incorrect settings can cause the GDSC FSM to
> > stuck, leading to power on/off failures.
> > 
> > Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> > ---
> 
> Fixes: cc517ea3333f ("clk: qcom: Add display clock controller driver for QCM2290")
> Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")

With these tags in place:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

-- 
With best wishes
Dmitry

