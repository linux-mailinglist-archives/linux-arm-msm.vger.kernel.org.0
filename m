Return-Path: <linux-arm-msm+bounces-108200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IAZAIfEWC2o5/wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:41:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FDF56DD18
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 15:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 17DA93016020
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 13:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F681481ABE;
	Mon, 18 May 2026 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipCDmSMZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSrDgC1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D59481668
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779111662; cv=none; b=jBWHeZtGfKMKc0c60DieZmfXXG1l4nLqQ4DFoOZNqKvki4JJfLq7wDuO6bBXNnuz6hdg3gnTnentvaXMOJFdEuzNrZxEFB7rro5pUm/Z3rApE535GyM12BCLe3vI6ONm+irAJS/qQ6m/6ColzFgHxTugmII/sbsebf8UO1+NXVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779111662; c=relaxed/simple;
	bh=57KBMhPoXOLrxYaodFJyU1hyz8hueBgCg9SK1L5VcN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gd33QiDijflqGI2TCBheLctrQmESGCVEE0hB/bObz8kGHnpE/xO+cDQnPz3JFJv+1YSCvHIexHIiI3fTbHwQZgpG56/fgKWwN3EKz4I5iwj7ZBMiDPiJ5sjdnFMD2ickY5G5copZtzAVd4nfUeS05zU3icyfhtudqtE/k1ipo9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ipCDmSMZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FSrDgC1M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICFw9c2701076
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/iVpdwss/V65EErDxjTuIpj7D/ub0rITgGHADjbz2s=; b=ipCDmSMZ0QTQsv7p
	MysuYeWl//kp2UqxZi6cY+Mbe0riuRiadjv66PX3gcmpBG6+L4sSbpCGD58V1gLD
	37I/2ZyOh8HNdY8RI+NJI1gVrypvq8NVmpjnMNAlMCL9ntMw8ssKlMRijTfzlaYP
	kOyrmccQgOKtyX8+XRXLGCWuGmPjsGxrs3ixPB/l+EXt5VmFwlM7wg6qwVq4WL2W
	n12miacMVR7PtGfh7I6JZC9Tcf3G3RP2hJswpP2hZjeNbW0B4qSN3GUvytXohtvX
	lncKiEen+oY8ta7DzyF77V8GHS/kZMHlJwXPL/ooVKW24tXF7vTJLU5ZGiqlwhBO
	qxzNYw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82mega3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 13:40:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb98b09d3so8331081cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779111659; x=1779716459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y/iVpdwss/V65EErDxjTuIpj7D/ub0rITgGHADjbz2s=;
        b=FSrDgC1MErVtx5YBlg6wQmdZtNxAMh1ypnUq51AkkKnpXO1heiQOC0NeFcAaACETs7
         jSl6HWTbggw4wgGPiJaIFtYIqA0uuA6FKwefHorude738Urwp53KQ1shjlIliW9upKMB
         xkVC7usK/NVrmS2jp6RgatBw/5f+qSciy8AsZ2tctKsLjnIE81o0wsY2m8jk5sC30dLx
         YYJpTtbNwtnL5knqoKym3Cf6sZzCwPKQmep8l4Ql6CWfkUOq0rWkKrjTFAaAXpyVXP5C
         n3un0BQV3+pbC56lYD8or17R/T1bkoT1139ENndgKTTAJsPbXdrpl4XuXhytDVxMEoGY
         gcKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779111659; x=1779716459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y/iVpdwss/V65EErDxjTuIpj7D/ub0rITgGHADjbz2s=;
        b=IoU1V9/XawQ5mBOW4lfRXeF2VPi22bQVvbZnhVBFIvS7QNXe1beeXTvpEKEhRy/XE0
         IX10RgGY6aHL/b0WfVRvfSf1Z5cvkrcBk42mNd6ovz0NpK2afQ+AMV6J3Kvl7lkcr5ci
         wKdI5LCS12OMCxLajBscTgh+SDyDi27IdGD16wW5bgEkmlJcZrRyuh4eqMutf0XiRq6y
         9irLYjm3ovtOXdJifzADKh/XlzQcGR9ZMO+zYnkNSlZ9F6KzeJF/kyDRX1cvN0kOAl1r
         Gk3t1VDGL27JPytd/Nj6qp9oEgKvhWF5K0TqzAkaBNS6yJnc5NS4GRG2YzAdNYtE5FY6
         Q0og==
X-Forwarded-Encrypted: i=1; AFNElJ/2+23E3HMGiJ5goxTZ1/QbasfLhwh7LVCv00gB6c9pE47tA0VTg+B752HuKoPkzAukImAiwY9L0HFQcUlQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzBjXLUL8ZyqrHNFSJ0YFaTRYk2iwyUEDVaJVG5RBqzmRUOx5io
	wencZKJ9VpF34JMl/PdcvyPLhevNnB25+zo1R3ugI8ug/xxK0xG4DHHsGmK1DNMfBbOhpBEUejR
	eLROQWYmLehJKoHr4gwVovx8zAJIxuax4Vgcy7Oua/+1IHo+DJInPG+2uVIG3vQw7IfW0
X-Gm-Gg: Acq92OG1UyZBr2dXzDHqA4d0bUEEA6u7wm/f3QW4sLHMCgr6VS/fDbuFx/J0xSPIGcA
	DgHrJU3mNmqLV4c+f6MCe8Ut04Cudv6I/6smLx65LcK9dicbP/P5HwXCzkHlAwekhck8nUa+6Ut
	5zq2//caEOFgJmzeQSBEqzQIeqH7AUL9Ozncj7uJ6ydh8pJ+4k/nq9TYH1sDYif4/jB7YA03SFt
	jWpvNjb3wuekLfN711yQSOFqSiD6zRoQw07Autj+a5p4UcZliFc/0ii9JCiA0+LVyKZECpM956I
	xW0XuFl6W6x9B5TBcUKnxtZvciDElzFcTv5dW1Tp25wvD7LC1aE3muTU7IdYNeH8w77aPNieQ4f
	pIzqsmBsk0eyEvOK6AtT+78oqCRgiZi0cr7PMq/CVTyvJmlEmoUt8Ej0g4yIgzC6U+nMGKEzzgi
	WBUDE=
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr134986201cf.3.1779111658621;
        Mon, 18 May 2026 06:40:58 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr134985831cf.3.1779111658077;
        Mon, 18 May 2026 06:40:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68311660f49sm5146434a12.15.2026.05.18.06.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 06:40:57 -0700 (PDT)
Message-ID: <21a1b097-be34-445c-b113-e9c9c70d7b87@oss.qualcomm.com>
Date: Mon, 18 May 2026 15:40:54 +0200
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
X-Authority-Analysis: v=2.4 cv=Tr7WQjXh c=1 sm=1 tr=0 ts=6a0b16eb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=FDeQY5eERw5HgavBjtEA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: dAqZGKBQ06p-RFP77PeZrpHEcw6CA1Iv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzMyBTYWx0ZWRfX/ZiOWe5Fa3Z2
 0IaV+cB3rlsFsGA0jwtWV7Q7cBO9yYVx+h9QurGJXF3dibjWecatz0FT6Co81lKSjdjga0V46AV
 aHjHjcM+KtZSTdZbhFyviTDQQLrw4SCXeIORsRYT+di4EUgXFbMEip6RwdS7bjJjo+BpdN9CS49
 FfgvaSUbUzSINUwNqqUlqEdPDpGcKeadAQ4HnCq/QGDeseg4O77+YfrUMaQls0aktnirwXdwMBv
 DPxkHEeMup9E0aTIm5LlWI0mgve7f6C0/WA1mk+sadaFFkjLHT1wKlADHCW/kOjnVOBSYaL/i5d
 2BgDA+f93TGnRpwVkm0YQ0Gr6+YU26qbanVpjHfZ6V5rYDVQ4avdvmBVaPQOseIXsI+XQXbyta1
 LOHtUGtUk0iHE2zwibEE4PdWDCo6hn1HFYhFGdnFsn1UuahVxCY+hEdhbsP83HkZ1HoA1fgLmWa
 7XKOkYMe3zIHTN/WkOQ==
X-Proofpoint-ORIG-GUID: dAqZGKBQ06p-RFP77PeZrpHEcw6CA1Iv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180133
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108200-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 29FDF56DD18
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

[...]

> +DEFINE_EVENT(geni_serial_data, geni_serial_tx_data,
> +
> +	TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
> +
> +	TP_ARGS(dev, buf, len)
> +
> +);
> +
> +DEFINE_EVENT(geni_serial_data, geni_serial_rx_data,
> +
> +	TP_PROTO(struct device *dev, const u8 *buf, unsigned int len),
> +
> +	TP_ARGS(dev, buf, len)
> +
> +);

stray \ns above

otherwise lgtm

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

