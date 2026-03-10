Return-Path: <linux-arm-msm+bounces-96605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPHoJGb/r2mdeQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:24:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 186AA24A967
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 12:24:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCEA830670BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 11:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 707A7314D13;
	Tue, 10 Mar 2026 11:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QlYfu5XV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TVbMoykL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387B237F007
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773141519; cv=none; b=aJwYYHP16bT9PiY+aKF2bOWdyhLFgn308DPVnJsxyvBMWFdlfmStlc2+0Y2IUAib81QSRPQ7MMUg2z2ZHLKVPcEqEx5CjxFwZpTVVf4eh6ajSB1GVW3ueE+KmWNWHMwyhxFdskrYeivExuhox7lvN5eE9JZe83npQeP/9Xo+BRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773141519; c=relaxed/simple;
	bh=VDhycqnzSIMz6WG5a+hEjX33+5RHQg0u0oIz2Hcqinw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RTJkwS2sTYnuwAWrLMSxo6ayPJ0GSG96HFnGWm5g8JScciCyP1tNKIifX5MXcfRyJN4xhrjPY7IJUIO7yRPI4U/5kRPptq9WrLv7VlXe1HMaE5MEY2on+Ety9M4RZoOj8W1XLqURq7VCxAEJYAKRlvYcgTZNwFjs+O3zDd8agFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QlYfu5XV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TVbMoykL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A8xlPG2460703
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=; b=QlYfu5XVNEkLdax4
	a6RFt/XIRvfaWo7pRocjrUBpjbEbQeqOXh5SHNJQ8SdbbPlqTJTKfZyByzBoHN2R
	UQ+swfGgHjjVi6Dls7b07hgv4f461JNLHeobjgTODAQhoqlJQCII/FMcPTnD2hdk
	5+XQuc4k/dIBotnY9whumegQUwBzME05a1AZazAoqeTBUxSCNNqD7wU1HTgbpqIC
	sq7ZmA/s9lcP0D4x2p4zdDyp89oa54L2zr4xIRlMaj4pDZe3Z/nPpOsMDAjYqu19
	96RrikdGvPTXcWTFV2A0jaFmjxoo7hqaIIMS/PMjLI2qyqRac2/IgyEr/IM+T4Yo
	PQm6TQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv1c195-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 11:18:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd7a2c535eso33692585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 04:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141516; x=1773746316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=;
        b=TVbMoykLSkIHJh1KgQfcPtCtjWAsGk748LGdvFT47JXju7Lf59tgJFrSDfv8w/izGf
         zZ1GStOgjazeko+Ui8UvRiRzON+AcmV8DwcNj5AJF0pNntaxxh0b1sYnQmRmO21flvT1
         Dp2UZlAWEdRsPeqWI5obrG8b6Ln0az+syhHHc8+BhMknzoHvZgtyhyux3isXNDOzTwDC
         sJnklS+ydpOOk96F2Dr0jfKzgcn5v1Jx3KuzoOL2f+w5Z5/SJvL/pMfOKZog/cnckopV
         duj+sCI3sv3BndEBAVXay0HIrFdY6JU/2perA6rEYdacB7uYluA0seTeY1VVI++UMOHp
         Vy4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141516; x=1773746316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lKTOqMrwzdJe8MdvtBsaM2UISrCW3NHkw/GkPvpThY=;
        b=YQh4rmRokkBlA1k/a5cDagklQdbMaULIa+Pi9Hn6gNoj2hM4qucu4e0WLbi6KtD60U
         MgFnhQc5GNWFvAc7CAtP3LIwdMraDDx2EVHzyrZwg8H7wjQNT5IlUHfRpUoEycvfpzsh
         zzCb0LiJgjPqZ8Bns/Dj+c1Mm+d1c3JnQ65yaxmUlAaDA2nqX0wdKhsCCw/R1r27YLLg
         SNj1WlQ5wkq86SEHlYV+J1D3eVULjj58tRE6yGkmR8GcW9enGt8p9536QndtMpuTwfvR
         6jtj6hSv3ewe51sIju3opFsFFTVwNKwUIz8zzPquCfzgvm2Dj+df/Cq9ustV6rq1qXYr
         rICQ==
X-Gm-Message-State: AOJu0YxJXHfmT6nSwlyXgDT0QvXhDC1iC6eI9w6nkwQManolrHjPwN38
	okmBnl1DgY8xZ4BVO1FCSmONUkoW8Y90ilbedaa94dkBrKehpJaQPB2MUx2Wm618dD3BHhNT6oy
	tKT8jjP6jhhAorqY/oc/qYllctoCspIVYV6rdmsv93Nn0i9dCn3bGcx1ksvwDJdySK/va
X-Gm-Gg: ATEYQzxUIB9H1hrWKJhSwxuEq2+bmLRq8UkA5sQ4lCIFWYYY9BO/GpuwMp/E8xU1xfB
	hiNRSTUyFt4MxSCuML0JgehbanNWME4QY4Y9T5jXzuJOS4ctpznlWI3RCqWeaRXS2E1YKZtMZ5/
	cBq+j66PHdGBh6fHOL5c2bPVRn7LYUzARMtC4GlPE+6u9OZKMwHLSdblHSA1F3VcFwF7qz82T0B
	B0VdA5Tgru3CwC6P1IMP4q0p0P+DoEVAFctIi+9J8KNoHNZVsBEjX7DYjUUKssGsm0WtNwrceCu
	zUCNjmCZRhwhQxVaTAT2YXGClSoMKLVmvtcmtIljTShLfbUAXpXOICafWlY9e05u1A91TYlDoPn
	og6G+ZIo8+eWGgsUCfBHdvoD6yxk0tjBZca/4SpKY9TyRs6FhELRAeyhbxLrlW3gNlZAZNR4ezU
	fDMak=
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr437814185a.7.1773141516359;
        Tue, 10 Mar 2026 04:18:36 -0700 (PDT)
X-Received: by 2002:a05:620a:1a83:b0:8cd:90f4:326d with SMTP id af79cd13be357-8cd90f43559mr437806885a.7.1773141515744;
        Tue, 10 Mar 2026 04:18:35 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a4fd5e9esm4078116a12.21.2026.03.10.04.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 04:18:34 -0700 (PDT)
Message-ID: <a96cca02-54e4-4ed0-9fcb-816c72afe0e7@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:18:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/14] media: qcom: Switch to generic PAS TZ APIs
To: Jorge Ramirez <jorge.ramirez@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260306105027.290375-1-sumit.garg@kernel.org>
 <20260306105027.290375-12-sumit.garg@kernel.org> <aa6O5tir4kVIe0eZ@trex>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aa6O5tir4kVIe0eZ@trex>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iujMqjZVqRMEjHYuQLuUGNGV1zJjw_eg
X-Proofpoint-ORIG-GUID: iujMqjZVqRMEjHYuQLuUGNGV1zJjw_eg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5NyBTYWx0ZWRfX8sFAPj0xlwq2
 DW+j2Dge9h7tf6X3LzUhkupvRG2YjEcqwlluDT1B1ececFGDY+0AfZfeanVymxVEXHjPIj44+1z
 Jo6mRDtomuuMjIqtvXBloI+RxT5ejAN6lYBcCL/K1UNTKaDzr7mKIdLEfsj4YCoV+zEsl41M0t1
 IcwUc+DB8Mh+t2YsSwT4PmLFkbqJbUkpL6I/mcOveO8eyn+8h4OO41ufgN+C7Kunp0okYbZevw4
 lHrfAlMgtw7Ma95QGdYpPThTLaoK/v0BK7q3tcB8XUfe7P/x0f/9TnYjR1sndGeOJ9Zk0Ha+or0
 61M+4EOh15IjZTiqAkaDMlolCnDHRQddCkSE9fOA15wk8eoFY3D2OKkGGiAz86FqXTk0OSxxE8C
 rYwGcIX0kcqpxUbfbjANtbxxVH33ZqVjKPELQWiDw95Nwlf0XGjVGiZfAFVSZFB2Qtpb6530ZvL
 VMq95EEGu5po0jKyCfw==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69affe0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=1RngqAJXY2j47DovaP0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100097
X-Rspamd-Queue-Id: 186AA24A967
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,lists.infradead.org,kernel.org,oss.qualcomm.com,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,linaro.org,qti.qualcomm.com,lists.trustedfirmware.org];
	TAGGED_FROM(0.00)[bounces-96605-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/9/26 10:12 AM, Jorge Ramirez wrote:
> On 06/03/26 16:20:24, Sumit Garg wrote:
>> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
>>
>> Switch qcom media client drivers over to generic PAS TZ APIs. Generic PAS
>> TZ service allows to support multiple TZ implementation backends like QTEE
>> based SCM PAS service, OP-TEE based PAS service and any further future TZ
>> backend service.
>>
>> Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
>> ---

[...]

> are the calls to set_remote_state required?
> 0 is not the IRIS/VENUS remote processor.
> 
> If it is legacy, maybe they can be phased out?

FWIW, in msm-3.10 (yes) QCOM_SCM_SVC_BOOT/0x0a used to be called
'TZBSP_VIDEO_SET_STATE', taking the arguments:

args[0] = suspend->0, resume->1
args[1] = spare=0

seems like sdm845/msm-4.9 still had that and so did 8250/msm-4.19

Konrad

