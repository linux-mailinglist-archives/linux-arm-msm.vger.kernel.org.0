Return-Path: <linux-arm-msm+bounces-103100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEwDKREP3mnRmQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103100-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:55:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6A03F84B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 11:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B04F03031B10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 09:54:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDD5F3C1414;
	Tue, 14 Apr 2026 09:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CdW9PDFi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fz57PK/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9554937E2E5
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776160481; cv=none; b=HHrnxkmvu24sh/URZfaqfhCo2F0bsJO9NsU7Wi3Mg0W7FqS0ofVrglnPJL7zE5HdLCljNFe0ImEV1Jy8rP7nbqahFLUUd6cU4eEHv/dPuouHQvevePE+rp7XTEoTwv0ZrWOLNROlka9gOl7vpQJDG9s1L8SY0SJlRc02onGLWi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776160481; c=relaxed/simple;
	bh=SmdgCecZ05O6sZherrUw+e5DRBJjM/QmfEfePAPaQRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lMK64DVvGbNhQcXz+VQgFo2VQehN/anfk3T7ZusPZWE+wZlt4+6aL2/nNzaYDI2zVQKX7S8J7Y7ms8MyCBIwtSuaz0PCqYD0WAY1ZPY+guwHLzLXMRYnlJWCe88SOTptDTKuG9b9qSlTGw7XdLylasFjR0D3F9pghtj/UCO5Nq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CdW9PDFi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fz57PK/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6Yj4j280867
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:54:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3WAJCPT/Q1T1ZUm/0S1VtzFJvEx3c7vts2cu3MyRNs=; b=CdW9PDFih1dG57+5
	k7Z2rfKf753QH/UZVsp8WxfmQjTvdwY0Lrwl/MoRMnIBKCH7lSydj1BShbzRCN9M
	XKeRSdhp+6C0m7h4T7BWbCDLUZ5nQ9KLhNZMUVuwJKvetcQ7KvH3eJz/cROfrOwT
	hkln3kwyBuyvWOhQGJuDuT/QSMD+0jnWMDBhEyXHoVI2AoHiHXJxQWG//DALEFX7
	P+zMCm8GtQVJuuAckjSEb/ZyxUEsSQ4E0UWdu5C6PCyDJGvJlYlx0v+QXLVsTpQu
	4+cmuxArzrY2wReaUN4UkiBW5fkKIhDScD0grTA1A9bzBh2ig38YsKkMQ27kq2J1
	IvqRbw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh86vj5gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 09:54:39 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89f548d0872so17702536d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 02:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776160479; x=1776765279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3WAJCPT/Q1T1ZUm/0S1VtzFJvEx3c7vts2cu3MyRNs=;
        b=Fz57PK/uCTgSpp0rZM6ojuSxNCN9rnR9TCVDXgWqiYWo42ZkQuRVop16Py0FxWZwka
         S8L8h36Gd29I+CVfbzfQq7d04JpAt4iOkDHwHr0xE84iPkcY/vtWl9Z1TeXb9Yu1GgQ+
         /ytVoGihzlcQ2cWrRdWugQCGJIlot5he3uiP+IlcSKLhhvYNNkSLn4mIykU8KDIaBc1T
         RhHuSyKKrqR1y1jeQ06hKcaopAHYEb3QyH5BwWoPX8cE7/Fu0HZ934qXU2MUCZRxZhMR
         26/QXnJlGg7z43k8O1DU1Fh3hF4XKt0xNOdyG9CwPryYKjPyjg8hY8QjwuSgjdE5pLaH
         fWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776160479; x=1776765279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3WAJCPT/Q1T1ZUm/0S1VtzFJvEx3c7vts2cu3MyRNs=;
        b=oERl68UTxcBZF7ZQI7sAoFfjq1C7dE2U9KtFKAYw7INbOPujsu7/CJmyFd3xot6ZcU
         w8o/T3UDBi1nGEYfIir1EBhZeAJBSh07UmYSBwNzu4pxrIW1RijHDF0s6P/K5FlamStU
         iChmdrIQog4lyrAHNXVrLsVRRdD/pszHLIYquBTxsIPnvdYYi7LJBtyd9+ScEDfZvwJ5
         xBVgBMNESg/LP5G+fmGWG9PZtZuMPS6Dj4ZBRo2VTtxGwsgnzMUaGoecONV1lCvAsYBw
         2W8ORDd23oNxb4m9lY5xPzHce0/tGvxzZJUCp01YOpw0syK+WmTdxl6hBiTDRID47m0b
         VuXQ==
X-Gm-Message-State: AOJu0Yxx7G4grsk/xlPWj8ZOmzd2g6VH/57SSSL6pdELmAlthp+PlUIT
	nL89RVxQFCNVlk5pnKleDCMWmEygsnBXVP4zasSqwWVt1+CCKfcAlntiTXqsBxW/bEEmSWAZ7P3
	d6zYk6dQeMPDKFlZBLxjVHl3j+S/MK3zUwEkXsULulsw6UaIsy+MHSoh/C8M6LyQMyyj4
X-Gm-Gg: AeBDietE7YU0suN6GEyH0jaPqP0WYd3St9q2kW2YVi4pz5Xs2GKxUxxg0vjlUVlMeKD
	W+wrXV4hSI8qU4p9wdxfvmLomoxd1eNPC7IUC/wSeLdG8UVGTXaO9+EDbIRy/xT5VrlQSuHMWlG
	OzD6/aw+YMVEvk6Ij4gQ6oour+28S1Mi+PEr5FRAM2rizLOdCT7CPTBC4YDk2faIPypjAYCRoxA
	Hd/E4dHWSTaM6UoFKXKkVHSjR08ASc3lQv/lTODvc6GlrJHgBwK2G+HGndXZWTFtGVJ898YLLCd
	XMzFekZvvZwiNKUxlEoDl8/aiS8s5yC7PZwAqODjZFf8rXBIT7CMWrw6qWBSk7GyX2PkmJYTdNb
	zbSa8vwWMMnvmLmAeTrIp8TOMiPRH7X4a1Bj6npBAgDwEQb8AEVWDuqflhW3msx9spw9EI+rGYw
	7VCQUs8V80sGHR6Q==
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr161421641cf.4.1776160478930;
        Tue, 14 Apr 2026 02:54:38 -0700 (PDT)
X-Received: by 2002:a05:622a:1827:b0:509:a3c:e390 with SMTP id d75a77b69052e-50dd8236028mr161421461cf.4.1776160478302;
        Tue, 14 Apr 2026 02:54:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7c8a4fsm374169066b.54.2026.04.14.02.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:54:37 -0700 (PDT)
Message-ID: <04258901-1da8-42b4-9d39-29969c5801fe@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 11:54:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] ASoC: qcom: q6dsp: Update bit format support for
 secondary i2s
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-4-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: jSdVGr_7eQzTvdKqVWQS_NjgK4DNAwIi
X-Authority-Analysis: v=2.4 cv=cffiaHDM c=1 sm=1 tr=0 ts=69de0edf cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FztgSbPjC0Y9QtkDo2EA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: jSdVGr_7eQzTvdKqVWQS_NjgK4DNAwIi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5MiBTYWx0ZWRfX4wJ8b5Cj2tXB
 ZRkiPio49WT950wPWEiEUaqLvRtmDvvGCKV96iVnE52Bh6LUGvm9K3RzVbvWTxOxfLQRtZj6FFZ
 FfKy4hyk0EkJFOR2EvZ60/yZ71mTaPzFP95k0IRANcPrvUnKrst2I3azntMlrnjukIG0yFhiDIz
 BTBVT+cfTIuM28mLTvW76tz68RwOeUTi05YYH1o4fouwbZBhlB9tYjM8JDktoWX6XKWV91c6zxo
 HYItdIcle+O83wTPIONlDQYBLz+ESFTTUvPAV4YmFQYXYJ+BGbbn1jHAiJCESrKXfQI0GxzUnXG
 YPZ3USVbi8G2imMsEv3gNuiQlmWVJU/+eNokKWFUZ57RZTKLTrbdJACriqAMbhLTG+dGy9FfpM/
 HhYJbq6TzR0qSMahu1txkhNig2RUl4ZQOCzzZ4vykETiVe8DJ2MSNbHwn9YPAxUQ3CgQaMONUZ4
 e1R0jIB3VhZrwOVUeag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140092
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103100-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0C6A03F84B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 11:19 AM, Kumar Anurag wrote:
> Add 32bit for playback and capture over secondary mi2s.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

Would this apply to the other 5 I2S ports as well?

Konrad

