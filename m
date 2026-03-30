Return-Path: <linux-arm-msm+bounces-100712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKUQBZk+ymn46wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:12:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6724F357EF7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6450D3004636
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 09:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9480B3AF671;
	Mon, 30 Mar 2026 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XLY/0RLp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HqNOqtOn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687832D6E7B
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774861622; cv=none; b=bNLz/xV18Cgm04Skow8AxKefdMSxvF8W4l0Y1Xphv8QKZvL4duFSREbrPAcwmIqeXuN8SGQj6SrBd9i6eiDPJBqVFarMG2chjo6k7ibte+0v0ZU1fGpTsVjelLaBkNaaqpGkJbUdKP1HI6DFe/HqtGd2I7BelNZGVmOMwUvHHXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774861622; c=relaxed/simple;
	bh=Tptl3XQi8137zN7Q79QlxoBzRAlIrVNt9gEkom3zmtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sgWLANCgHcH97rcfmoGKW6/j1OgXDYO2KfKavFiVPoOSMxDjd4+T70N8LM9bw6bYnxEPJUqybhiQNhb+dBsko7F/7h/lBE+jl0KE3y98in3oo3r71Aa38p6bY0J4QDYNT/eaDQ/ZIck0NAH4mKV0Hmz9rzRLvvq8wgoVh2zaTAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XLY/0RLp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HqNOqtOn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7UH6j2413584
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FiY5ivXPelTqDjFBB25MCZXhs4eGfx/cjPjYQdrtMmA=; b=XLY/0RLpjOGBz0i3
	R6q4W0ajIqlZOmX/nzv73kXyBo28JPclXQosgpoSNKyYTn1+hCMOviZoqFenRSUn
	/7Lyg5/uo/AWBcpHG6wh3gchQQGUCYiCr2zlQdWR7/OGJDoU5fPY9DCrPXxgCDd5
	o4xFZKSZhLuDD3DW9+OGyqBlEznbOqITtsZ9oVbMeHEikdre8zEMPMtpS1SZF1ur
	S2p6q9GA0BoYUFNX6U+zYwaxX7UoNUpUoEib6reabQwBy/UNC47ql5aLPEDihAp6
	hHJsK9ho4pfvl6M+tkWASbCAp0J3t9jr407FE4XL48N/AsqLAmDg+kQ7myFmxsBo
	+7/03Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d685hd9uv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 09:07:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b33a19837so17628581cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774861620; x=1775466420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FiY5ivXPelTqDjFBB25MCZXhs4eGfx/cjPjYQdrtMmA=;
        b=HqNOqtOnRDyTSGpvP+jZn+p5EvxKvAV2Vlw71i1gHS383qA5A8oaqAwFyjm54AZ8fa
         2K1MbxYXc2QHqh1KDutTY/ssPvlQ7gEi/O5x7NAd1fqkBa0JT4ZaJy1vqfnDa20F4FGl
         f39OkYJX1NQ4MACcCY0Y2pyP9c0bn+ZWGW1NrFGVfMN66aP8XAE6iUADjPJjpYLpFKzq
         bBUTB7OFI5VRyQCi7djl0LNtSJZF/F4RWaeO6Sh8I6JwkNIi2AGtJhtj1J7mvn+bh+NP
         PS1r4qtRn1qYKQXUaCKiLZi4IcPEZ5Rm/CVLBfmLE4bmsCsoaYzzavSK98cJHW4KvGDi
         wxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774861620; x=1775466420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiY5ivXPelTqDjFBB25MCZXhs4eGfx/cjPjYQdrtMmA=;
        b=BdN/IV+KcaKt7oLEsh3rE7RaBdHdKMRcEDu6eK1B2zKSmDTpHazOU+GuJ7veGnFhlb
         gsn3l5K13lM40693HKbH67jtvhCKbjy4a5UxPqICzNHY0hzqC3cbCvs0gtsx6WL1+TU3
         iJtN2LIv5aMGiM40CeRdGDrICgjiUkrh7zy2UuWS0h8H+k3D2ARQ8L2SEPefSmLwkgCo
         LbVCEf5qOIgxghzVUcrXsdngE07it/hDsg/H/NYNpJ/GOiwGKri8qkd5BAdJU1RYC0vO
         bxXKH1jFIRD4kR2MmmhWWDpy4/duN+DSwLgu7riSb1tIDFspbeB9V7/lHUDVME5KwR7n
         4qyg==
X-Forwarded-Encrypted: i=1; AJvYcCWXNlVAd9cgbEYhEns88yPDjm2Zrf1SbXzTKyxvyhs3lKvYU6TwQGxw9KN/6aI3FjQjDGJsBveRrvnbsrEY@vger.kernel.org
X-Gm-Message-State: AOJu0YyLehGWaTU6+zUBAwOrNRLpd//dpU+tPzct6oG/3aAsK62uoukW
	5PKkgFuiAsjIGrEdoaOlpya0MNuWfDSxfYmB/cV2+0ZyQM6AL1GDRJvklosBSW+6TYXOLcq+FCS
	UOmVBS3PfV//ZyCtkyzolAYzn5T4q7NtzUSnn+hv/Mrs0uBG3ODwz5PIplr7Y68AuUBX4
X-Gm-Gg: ATEYQzxt+NWb3AyBMi9FXvNu/XvoZAUPNwF/KSd8eBupuUVqoKfvCbDMRR5LW+uogfP
	WGz3KorPVviWOwZ2N1Fj195zRLO2V/dnjaOk9bbLalKb20aVTnqIUgO7+7ufqi2JaZ51iAhEXRv
	Rpq8VE0BTtqzXJH6DF7+4JfIyeUGsT7TZveFVtseNGKFpkvhfcTk5A0P2jtfH8DsZyY6cvrZk/+
	tUKqSrFqCpb+4/5j9K/SeJYEFP6ezm6NOqsZ3rNVhdZEp0/Dp6mNSCnsCHGWd8jrxe56NMgd2T3
	6H33p6ei1WgLpuGgMdH/bmVXA6iaeN9q/PSvCsgPNU6XBvAPMW5GEe9UQTobPLu0xad0kHU7EoA
	/ecxDFAG99nQvYAnkAZMI/kdkacCiF7f3eYeVp4H+hX3kXKOaSAtDjW4rBjV845HfESXytnX8sn
	AOdJk=
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr119317351cf.5.1774861619846;
        Mon, 30 Mar 2026 02:06:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8f:b0:509:39b1:d4be with SMTP id d75a77b69052e-50ba3905198mr119317211cf.5.1774861619364;
        Mon, 30 Mar 2026 02:06:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b225193sm261624466b.57.2026.03.30.02.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 02:06:58 -0700 (PDT)
Message-ID: <91a5ec85-129d-4391-b474-be98d4943fab@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 11:06:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: aoss: compare against normalized cooling state
To: Alok Tiwari <alok.a.tiwari@oracle.com>, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260329195333.1478090-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260329195333.1478090-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=csKWUl4i c=1 sm=1 tr=0 ts=69ca3d34 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=yPCof4ZbAAAA:8 a=9TbgIqzvG4zarLK9GAcA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA3MCBTYWx0ZWRfX0mJpToPUr3rk
 RninrJ0oE+2+j9OgkyBfNlwisssrAe0DHKi/5Zxl0iUx1yiZKQ5Zw5gJPyTsUjukkGZoHxWdCOl
 5LJR0qlWgo4AifFPIqd5l6LvuAIk+GXAoGCzTLvKvYMnIXVwuIby5oSh1eWV4o/UruN9AnRH+9j
 kKnZybw3U32VWvIOJ+tCH7paPy7xUrIXjseMz/+rgDldwxt89jhKmoeZB2vAyKRDOAH+z0LO5eZ
 G05PaRBwh+dzu0mCb2S1qfHLr/u0wKxhHvtHX6PN5RL/d7GbmP22JyJs8lZHfYI2idg53mfV/X/
 BvRdx9dN/WGUvgEvxLhDDy+PDobnG2NDXKRLhXdtsfTFEblFWPvtkO82NbsK4TNrIdvEyYOtxwT
 0RhNO9ppOiq8mGJjk6VqEF7PEswx9AEWwS8RgMoI4S16D+P6is5vw6koX3sRd4A5HoMDMsVW0Dq
 R8DlIJRGwAvRT+3Jp3Q==
X-Proofpoint-ORIG-GUID: vbm80OeA0UiIYU4zVB1e3qvosyUK7-Qo
X-Proofpoint-GUID: vbm80OeA0UiIYU4zVB1e3qvosyUK7-Qo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300070
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-100712-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oracle.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6724F357EF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/29/26 9:53 PM, Alok Tiwari wrote:
> qmp_cdev_set_cur_state() normalizes the requested state to a boolean
> (cdev_state = !!state). The existing early-return check compares
> qmp_cdev->state == state, which can be wrong if state is non-boolean
> (any non-zero value). Compare qmp_cdev->state against cdev_state instead,
> so the check matches the effective state and avoids redundant updates.
> 
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Fixes: 05589b30b21a ("soc: qcom: Extend AOSS QMP driver to support resources that are used to wake up the SoC.")

Konrad

