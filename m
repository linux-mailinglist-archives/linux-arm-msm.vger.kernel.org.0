Return-Path: <linux-arm-msm+bounces-108206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA3IOSsaC2reDQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108206-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:54:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5115B56E18D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:54:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2B4E301496A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:48:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EE5481226;
	Mon, 18 May 2026 13:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gavHswAi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="icmeT1qt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAA7311C11
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112102; cv=none; b=o+6UgUurtjnCUdpJcyshEzsQs0bbfTDpWOcB8DhsPB+O/iIIAmGRG0coNKoNIQrTsuCY6BMwbwOqJOSSIbG06DDW9pxrlQO5PbwhKGUpHuyHvJ6Z8uAJ88sXvxm4hbGcARY5bny9oNWtRcFyRzYZTk5Rv/Z22evSf9/oh1i8qjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112102; c=relaxed/simple;
	bh=TsPTaLl4zd51BWfkw9BwNOjMimnL7v0jxxsg0D/DV0Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HakadrXcZ6lndQmtDaGhDlx4jlak1l8vxAFO3eiVZ5HpKs5r1AReBO8upvyhxqzOicG+Hib45Ih1Yq9vscz64jWNcu5K1vLU7Hb6RbPhg6x+YUzk0BAiUoQz75gKz9ceo5O+4IAUlooZlWJw8ez1RBkicCaR11SVYMfQBzTefPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gavHswAi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=icmeT1qt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IA8URa2091009
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:48:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2Nbk6ywjfh6gS17Rx9fkMwIvBKLSedRDvKHTRiJg+Y=; b=gavHswAiwzXoxRxn
	rIOK7IzhysX5RfBgzYPgWnU6GzQxm+uLrW9rf9pVM4c8ncRjpCJbKckp5TfX2Xfn
	3q254r7zf7e/t04lnZ7pSjPE4Ep/Ep8pSxKl2INR5i57AIn4K/X2uKdEoVgj2VZQ
	G4hxOkUCdlPkMPziwXsgWALE6HGbnXaxVwRcoETNQPEyA3Q8HcX/WtXpZLJuLlSC
	U1pLJjiCIZ/VMIIuvL3B2eCcypIZmLxc78ki6NWpFAbUNVmAqI5dxwGHXXH1/do+
	mBzWvFUpe4tyGHQ4Wg3RfeSgHDRcx94TKVUpYNa/b+hXiRVVELBLtIWejVEv7U3u
	ChUC8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e80rpguj1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:48:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e576143baso7940531cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112098; x=1779716898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N2Nbk6ywjfh6gS17Rx9fkMwIvBKLSedRDvKHTRiJg+Y=;
        b=icmeT1qtwUjoUQMGBaMt0caLEc6BmdBGCaRgmnFcg496xO1/n6e/BxWaoPlaeY+9Jw
         hnGPq2B+ZGOWaHalnE3Qw6dY/oXVVDfcVmBVQlIPamR+n4tucTjS+BZ8pmAusXtkjwmW
         OxObkWnm0ryBP3VQ0ttJNI+VKgrSObe4BI3TaJOmypTpiTjgiptXkjg6j3pTA9hHVnQF
         xs8pUisYm3ZN8TwfmxXXoIebPZ1FynygkNACDVfMHUIGPnQyMtPSyxuaNnA+hieFvdJe
         5UZ3awjcPdRGLZ0E0fVsAheB3fZ3CARLUtoHzxX3mq3BaKAlMP+GwjNeWfgkSVf88tXK
         GJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112098; x=1779716898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N2Nbk6ywjfh6gS17Rx9fkMwIvBKLSedRDvKHTRiJg+Y=;
        b=OMMA8gydB3XY8Y7c9brxYOvB7uiBOPkG0J6Mr2taimw6zYEocYUIPd5N0PUCY1E3K9
         F9gFlUqMPpkCYY8pn9qf41jW9bynoaH9RHzGCCjTDEQZQ7l/HEUOrfysszyZj7uZxbqK
         WycbkpF2al1hKFxsWexBAruGj6FUfzQA2WP3kslzOjbwif3DfS2CF2rFk0j1ynR1Zb9I
         wXDgU919Irte8aHSpgUzCUyLtfOOw1ku4KRh/RIE1Q5rWx4jdWqvUb/7sC2byoh1dwyZ
         7cPKM6aAfscsvwVFFT8rpsb9Y2QZ/Jv822BUN1jD1u7ApCWPa2wfYNnztDO1rOjwD0gm
         P56g==
X-Forwarded-Encrypted: i=1; AFNElJ8j86BLq0ej6B2btBKfMJbNJ4Rk6DDH0umrlAo9sbNzxN4ksWNSOwsUgSje9WNj4t2w1NicpHV0w+e3zzy8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc0QsytxuJjYFrHOU9+WQ7KiWi9nNdVfMe0qIjKTyoUMIOgrwD
	2L2PEN1jFEy7DukANw/6CoYmgGbIqG8Wdv6Tw+9sfc7mm2C9BjBSayOjjXPKNP2SXvp9V9hRl4U
	Rn+vTG5Gs975LNieDkzl4TzORv3COgiXB9hjG4vJl6O+9x9rob/z3JZSqG02sPZveADXA
X-Gm-Gg: Acq92OGPgCwa1zn8dmeNAtp1aZPnz1XcJfehJyxRogyTrKqigTaKHbNJaMyW0sD3lBY
	N849u/r+nH8Ekuw9aPffaMqd0Z9p+KuWjO+WVrPFXZGurdj1SkyAE2VbfgsPl51B//5G8Y7A/Yj
	do5KOEzBabo6Vlo3lye0TkJeE13/0Q0xQWxmst+nsJ1oSbyg5UiRHxS77vst4MyeDgdxcm37JoE
	QXoE8jDLTew765Noeawwm+ZTPFbJhFqK21ia7sJ0Gk0iFxAM4IzzXqCuRuUbIK4vA/50+ZixW9O
	Qc7a4raBbv2te6BRa5MYeWwAlqpVNlW411c9JcoHsgDap29yikpp/l46L0AnQ0p5FnfT7pSDPLx
	xyXpbmWAtp6aVeDSZvvDyjnifaV/bebAq4qkFYilF2Wvc/pg5r+A62pgbn4t7jFRGGDRQT9g6dE
	5Efxk=
X-Received: by 2002:ac8:5945:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51659ffa7abmr160058251cf.2.1779112098404;
        Mon, 18 May 2026 06:48:18 -0700 (PDT)
X-Received: by 2002:ac8:5945:0:b0:509:2b5a:808 with SMTP id d75a77b69052e-51659ffa7abmr160057791cf.2.1779112097727;
        Mon, 18 May 2026 06:48:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4e2d75bsm561146166b.45.2026.05.18.06.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:48:16 -0700 (PDT)
Message-ID: <f8ce8518-8a4d-4ad4-a948-70e133c91b05@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:48:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] serial: qcom-geni: trace: Add tracepoint support
 for Qualcomm GENI serial
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu
 <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Aniket Randive <aniket.randive@oss.qualcomm.com>,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260512-add-tracepoints-for-qcom-geni-serial-v2-0-a5726421b3af@oss.qualcomm.com>
 <20260512-add-tracepoints-for-qcom-geni-serial-v2-1-a5726421b3af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260512-add-tracepoints-for-qcom-geni-serial-v2-1-a5726421b3af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: s-KV7sEq02FaA3E6CCra8pogx1HUlfG0
X-Proofpoint-ORIG-GUID: s-KV7sEq02FaA3E6CCra8pogx1HUlfG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNCBTYWx0ZWRfX3MgxBjuzaPtP
 uyUJLDuRGcyI16RrpheDAVoNd4xpqWak4ynW7JsdxW+HttzxY+6QDFwHucF97YlT3RJuW8h9VJI
 PY7/bq+4CMwev5it0G/KBTnhxBPrYwHXqZ9kQE1oRkR2b6Z207eZRMaADmSvJAObwA1i5R8p0h5
 KehEN1ZBRqW8YWVZ06Wcgf8Dqqy2hQ5wZWnCncdhRloFADcaONW9PSlqsDYTbXYGEp+ecIR7kYO
 sYDvOn2GkrVbpMZ5pcI9qp/z1ZL9C8Q34HqKmvSXEbFWZMvUjXPxNhF5XUZWjht1Nv3JAHpVtpk
 1coWjLQjTr4ce0oSXaoAfP+hiwxIBQRmyGcrY58nh99/FgKp7sL4AR8bn6wPEMrtXp2vuCxVh/Q
 21IekqqdT3tEFysbsssTFDExcCvv6OFge6gbzg+gZFqs4/9rMbc/ZDqZaif5+R9G2ZxOkpWi7d9
 hQ6QN1M1rEFp9cA1wnQ==
X-Authority-Analysis: v=2.4 cv=ecMNubEH c=1 sm=1 tr=0 ts=6a0b18a3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=zro_ik8Ip6B-mArceiMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180134
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108206-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5115B56E18D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/12/26 7:14 PM, Praveen Talari wrote:
> Add tracepoint support to the Qualcomm GENI serial driver to provide
> runtime visibility into driver behavior without requiring invasive debug
> patches.
> 
> The trace events cover UART termios configuration, clock setup, modem
> control state, interrupt status, and TX/RX data, making it easier to
> diagnose communication issues in the field.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
> v1->v2:
> - Removed multiple TX/RX trace events, instead used
>   DECLARE_EVENT_CLASS and DEFINE_EVENT.
> ---
>  include/trace/events/qcom_geni_serial.h | 172 ++++++++++++++++++++++++++++++++
>  1 file changed, 172 insertions(+)
> 
> diff --git a/include/trace/events/qcom_geni_serial.h b/include/trace/events/qcom_geni_serial.h
> new file mode 100644
> index 000000000000..5e23827881d0
> --- /dev/null
> +++ b/include/trace/events/qcom_geni_serial.h

Oh, I only noticed now that this isn't in a subsystem/driver-
local directory.. I suppose it's up to the other maintainers
whether they like that

Konrad

