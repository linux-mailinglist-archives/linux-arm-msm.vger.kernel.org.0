Return-Path: <linux-arm-msm+bounces-91833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKkoCj58g2lfnwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91833-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:05:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB82EAC43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 18:05:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7883F3013949
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 17:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05511346FC8;
	Wed,  4 Feb 2026 17:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nVIWh3Td";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fZJVoKcR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C554B346E5E
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 17:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770224543; cv=none; b=piCOQJUoKEhvx+M3RHeuztlAAkoCqsXVWGAM4beUUi/j5TjBUiitl3xSaLJtzmqk94GgQC6y3/iD5AJ3OhyWS4Eaxytwkd990sHdg0qCJTdOi45/t+Mz9IXcKuJhK5rII1/fwgPlS3aFSMkTJYeV+l1PWEUZjVFo4dYkf3lg1Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770224543; c=relaxed/simple;
	bh=nnHZV7AAqXqUQe1d4STMvjxcVhLgLzrieyguTS3hyRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qjB6nrcGFRGTUDFmuxytYH5FWgh8WvKT/rTOkBbdYlSlIVEgNHcYyJhcQ5GALwezgEQD3XXDw6QHuiVwzQUdez+7W6TV4Lz6fweX9amiQS1cX9qnssXAGVxETg2/JkL3r+LXHXgzeOPxOticNxQYrX9Hs58zq0GUa+bOpRngNow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nVIWh3Td; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fZJVoKcR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIRWa1245903
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 17:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7TtHj/lcyNRtk/zB9O7SKyf9AfO0zCvDPAlhMJjLD4=; b=nVIWh3TdH4xB2dME
	o7yG7ali2uxi1kbp8C7BSvguGE0KNKwxGm6+vHAbmNGvRyXFQ6hHW5LLd/xjaeiw
	fO+xiMThzB6PIe7TPRB4PClittPLJauPhkii4n6RUtMztWh0yHZN4yLhcdmMJX6k
	Zvw5+lIbsZaxiJxsxnLFfbL/K6e4/dj2b2i4Cqj7efbg/Tmj9xsjvpxjGAPxRzwr
	lJMnnWKuyln/Wj54dzdEAndlyMKbS1cKOQH/MwtxQFU5esDv7vOEnqHmPdGDiwTR
	X9Oj7Af8DhnsF85UQYcPyUMdto0JV6hByLcy+z0JArZDChEzmCbJvjfPEUXLq62g
	g3G+Wg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ru9bby9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 17:02:22 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7cfd4b12d78so8117a34.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 09:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770224542; x=1770829342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7TtHj/lcyNRtk/zB9O7SKyf9AfO0zCvDPAlhMJjLD4=;
        b=fZJVoKcRu/jafiozGRFp4uEQNyrBZCUkmBFAIluqFK/kmO1mMd181+SkLD5X3L/o3X
         kIWwb5+htMSLh2MQ+CzkeNMTSVSH/E4f+gN/Eq7Z8GfIjCgoAhpujukVk2mTo4udmBFg
         xsIa0H4g7jBeYhXhti1DK/sN46XFbqWVDT7ajRnhNZ3lCKzU5eWopBHU9zIcF6O4r110
         NuzzNz/8OwziRK7zQdTN8H9yYoYKk/8HdmZJJE1kI4EsyEsUAcaY/7fTu16TJR2wdVFa
         YWrFxuTx3lJPwl2J3jBjTUddiGhaqnDlqFYdtO9+BewpRa54ZnE+eNY4lSXk76cSZc+M
         AasA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770224542; x=1770829342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7TtHj/lcyNRtk/zB9O7SKyf9AfO0zCvDPAlhMJjLD4=;
        b=mH0dhsZl2cOySivgq1UPUDwYsGYsXOh1DoS/nEwRSGstna8bkrBdefXZLrKxM8KUdG
         x8z45RQVzyItTtO/qTJON0IX6ae9WdAa6G/+SoFHMhzsgossYNi1synQU/eW4vj45A92
         eDkaL2dHqIp+IlLgq2CITB2WcYF5oXvo0GDfCfhIRYRK2eXmOpQ3Z1JcgECwJMK6ruxi
         QMJdQPVZFHOlTHnDCvxcBoC5tTumbboAAIRx1SwI5cHee1eKFAf1rk//PE3i6QavoxaQ
         MzZOEw4H0XbO8JECNFy7lLpjGnnH7Saj0ti+KeSoJ+blgaD8XEaEXOAeCMufITPKhVoz
         n2Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU90yUrHnFVHD16anvmOe7+8XGdZCvoUq5wbqIDHOpI+ePGfNWjIkUB6sGknJq1QQpg9kh4JxHCWOS7UHhZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr1lLTZbp3VBWoVyOfrTT7a9fUzi5efsal6TIyBVlxlGfi1Skx
	E6P59Q9A4N6/LhGXMDBLO+e86yjHISSdgr2riLc+o6BIYUqgIIj1G/r0e6Sqj4uYPj0QFmsfmNJ
	OpEKU2VjtwK+enHpxses9lQ9jGPAcZ4kf+P4d6HKOa+k0MlramhPIdaSzHZyuy08pplWE7wEF8g
	fF
X-Gm-Gg: AZuq6aIlUmMjAYqcBWH6mtkkvcGV8CgaL7Oe5XA8BOPsvGyVMaNHOIUvyQmU91pA8rK
	SHOIlkHbdCxKgwHP8yWDGSqpyMncs4/XuosZpmmg0usyyi2OnAsrblNqFjLNXEDtuZVbcoSOxFN
	tUacdKle6LwdqjjjGzLJ8bNpz1WRA1jQs4eoUPWZ8yHXBdqvl6+aJ4lNR2ErqFdqRGsnxFdfIn7
	kn1OzlpGVQioSbl0LI+Nqp1zGjZfu91mvJWSF8gpo5wFBOQ3fMUg3q4KiD4z1vZJ6jLHVUeR8zW
	kJh2HDPnxnzAKEn8Fl3Aw55ey6R1u/uBRkfoyChiXlCWWLNKyH5Ql5V9KrWKjQ3R0O7KInCy+LO
	cY0/PskoAabGRnsDJqrZWW8MG4MDy3kdNYB60uOjCrd5PokICxOGEB5yoQ2pI+Wjo5kQ=
X-Received: by 2002:a05:6830:3153:b0:7cf:d9a3:12c9 with SMTP id 46e09a7af769-7d44906702dmr1774023a34.7.1770224541744;
        Wed, 04 Feb 2026 09:02:21 -0800 (PST)
X-Received: by 2002:a05:6830:3153:b0:7cf:d9a3:12c9 with SMTP id 46e09a7af769-7d44906702dmr1773924a34.7.1770224539871;
        Wed, 04 Feb 2026 09:02:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6594a228ed0sm1492639a12.29.2026.02.04.09.02.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:02:17 -0800 (PST)
Message-ID: <3ec4b87c-f967-41c0-805d-27c62093e990@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 18:02:13 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] spi: geni-qcom: Fix abort sequence execution for
 serial engine errors
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        bjorn.andersson@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, mukesh.savaliya@oss.qualcomm.com,
        quic_vtanuku@quicinc.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com
References: <20260204162854.1206323-1-praveen.talari@oss.qualcomm.com>
 <20260204162854.1206323-3-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260204162854.1206323-3-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyOSBTYWx0ZWRfX5TjRZzoBK91X
 B8T2tSMqzrtem1K+PuYpkYOyRka0Y7H53YUFkw4mzRve3a8LnNFMI0ouiNZZVezu2W17HOyvNpo
 E4wObqpIP5ZrDinDd1ZZ0vPSesPUUpN2t8zy8YFsrNGQxdC+vgYGtqkc29Q+ijV53QVVrPoNAQj
 ay0yOBAVrvw8+ZW7jiRcIEMVpfeIAwcWg+tYBcNsdWb9VLmJoFHnXhslgob65pGG6Rre6oGxz8D
 TYMBWkWWvBmJzlqKPEPkxDGA1JE7uZywSKFDfRSZevoWM8bnKy+nrIIljUCNL1oZD9k+m3LrhLf
 XhQyRYnvz/xu0qnIOPrVqE+40IfZHdn6GQA4XwIEq2mFa1O6qAbhO4WB7dPH6A9zFnTGPYujTp4
 iVvHaX7S9NUwpYM7qSmL2jvnUadOqENHGfTwpTN93mBsBHS/Ucb/k437YIYBU9DPbgVJq/uMeaS
 WiNVIz7eDdKjCLTIQRg==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=69837b9e cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2ADkXApKhB2aXO0F1dwA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: cb2muhkFbn5W3wlBOQQeH38U3Z31dIgG
X-Proofpoint-ORIG-GUID: cb2muhkFbn5W3wlBOQQeH38U3Z31dIgG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040129
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91833-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAB82EAC43
X-Rspamd-Action: no action

On 2/4/26 5:28 PM, Praveen Talari wrote:
> The driver currently skips the abort sequence for target mode when serial
> engine errors occur. This leads to improper error recovery as the serial
> engine may remain in an undefined state without proper cleanup, potentially
> causing subsequent operations to fail or behave unpredictably.
> 
> Fix this by ensuring the abort sequence and DMA reset always execute during
> error recovery, as both are required for proper serial engine error
> handling.
> 
> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Well I never left such a tag, but let's say I won't object too much..

(it potentially carries legal meaning)

it's fine not to leave any sort of attribution for small changes or
suggestions you receive during review, perhaps suggested-by if someone
says "oh btw could you please look into fixing x in xyz.c too"

for the code:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

