Return-Path: <linux-arm-msm+bounces-106837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEDyCLNqAWrRYQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:35:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB8A5083CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 07:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 35CF9300185E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 05:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457FA377EDD;
	Mon, 11 May 2026 05:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0ZFJr9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAZM9KmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072D537418C
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778477741; cv=none; b=kbTXa5/8zo3ejzzQ/acTI7c4wC9D5QNM0jhaFQf3V4jQMTia+PL3X946x2mIWHppxP7thcysYp+Di2luwFwN3tfHVmv8Cbtq7x6opKbLUO6raVg/c6fMMduz5dtThoaH2ZumpJ7wi3MuYum3NBiAWdvpRIXC7n6pQeBx/KAFjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778477741; c=relaxed/simple;
	bh=jwzVGwaK8X12Fmx6Z2iPx6BVLyjWslbMA1jpIWzu2w8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTi0vZHNnEqUjW0z/ZE7W3lpZAsZxOntiUCO4nnaKUFu4ahqsxeMrJNXab/drynRMszCzsXtkSWD6h3epbDA0CaxwZLOjc3oUWuAD+Kmkaf1Ys8S6lc3YomSCjPwsBgoZRbeJkoB9zi04TMwFnYlsuAaD4VjanqUO22CG5/prSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0ZFJr9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAZM9KmM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64AIU9cw3428813
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yCDZHP2KRhvOmwGk8RIlLDxbs61cjpW1FARVt8QP0gc=; b=T0ZFJr9l3iq5llZT
	mqi9ljNX+R/bdMi8xgHgSYCJjwZqfQbSe7gGca1QoqgdxsCsU8dCvuEZcuAFVUDV
	ZoXxo6NlW1w4LOmRE+IS7jn0qLQMjau54rjA+F5Pd7UmYw0pY8hyIH6f3fPBScaX
	CT1fD5JM2tg96KW8LstmSQkozNvcuYVkqgB4VPX+tA4IrYvOnG4SX4A4zQyJDD9l
	N8Z5QUx8diQe3yx3uFcimLz+Q7G6NTpDDWjuxPhPMwVgDmuGt+eohOkSRQoVY4OR
	LGF7wNaviY+FLop2CuXJH5CeOyLCyyn7KgE7ezZcwrjqqpd818uyqoSuezKQ318i
	GDGOUg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x3k4m3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:35:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso43207885ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 May 2026 22:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778477739; x=1779082539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yCDZHP2KRhvOmwGk8RIlLDxbs61cjpW1FARVt8QP0gc=;
        b=jAZM9KmMt+S9kk14FhprGNv0crrPV4K5jRsUcd90c4+1/K6750z/N1OvLBTeMyy7wW
         5twALO8jA9cbgPfmW4lKklRpRtbyfCqlu/lCAJtrK2L+/o5JbnL84A32c35At3NMiLQC
         idCuycD3Ar0NptkSmdcasgKrIx1D6uXAJbV+aQ6jwGQNOyaFjCXd9c2OciDOb5eNWGaX
         GDHvnWi86pdftGMVhP+d+8x68hKyEKrgveHc/RNGfn9StKA4+4lWYbUq8ghF3lNx/+t1
         818nGJuT47IEGCwtvfKFZSyGq4hIQMHpfMYtDq98TwOTg3ji7Wa9x3rGBNG2KsISKDT+
         FxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778477739; x=1779082539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yCDZHP2KRhvOmwGk8RIlLDxbs61cjpW1FARVt8QP0gc=;
        b=IsMjXTWXBaHNVdctmciROH6d30LzoXn+I0T5LJVDw0MjUQM55bRknAf23XcYPAK4JJ
         dpcmh8VJoU0DTWvvShOEZ92WxDPM0ENW8iQ00l5SiLpbVre6cEEXrynwKI65F87HcuJk
         sSZqBVFmLeeuuZ7LRzHYc/ib0ruRvMBkLxyGclplhUiSpSd/BzDdytpFdxmWi38z3lQF
         tLbrwVXYwa7GX4mWi+l0qjcw0YFIOfPfUcaQUdPNjfqWcNyqetGA6tb4IGw7e6scqLQJ
         nvgMyJOCAJmhj+WIJMNBxH785WQGka+5L5QBtF74/nIQjSMBMVUtr7n9OVRQ/caAxVi1
         KyBA==
X-Forwarded-Encrypted: i=1; AFNElJ+nCjBwgtm0TVwm6pMa1ZnC0Y7b1FvNC+zQqFhsk6t99wc4CbuhW98GpSZ4Hw81xK3a9LncMHzoKgAEgzLS@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUvLRhj2s4+sTylODc31C6Dw3SgX4P+bDGGnLYjR7GJOP5R01
	yzB7l2BhdMGuWUHfZD+OszQKEwIsF5cRQvJBXOa4XpVktGdENvbpezWww6aWbheFgoTexwucKmd
	hV+flCEHqVZ/InB0rCguJoO6MXUGMRNL2a42XwSgQQliL70JS0EA8b7bfP4c3N1Xk7eJP
X-Gm-Gg: Acq92OHu0KWFeHKaasRbN5mHbhOtDOXxMqQEdrf9/8eZREmtN0t2j2wgbCNhV0UBWpL
	WRpo1fw7q92eD+ST8djERBPGKQF9zkNb21FpzaFNdc4ewRQKzAARAS2Fde04zL4iBBGewKYtskA
	1aE+7IYJEyQiTyDLwLL2wNDT5aQE27xAFlmPHqPUxUO6eFsI0jAcaNjqpb7ppEKv45tN+fPdfoH
	LLSMRS4HGbc9a9xJN9nrJlHs++x6+osU5RHz4QmjJocfjAYPj+PAFekdfV1weCMo4iFY1XKrF97
	33wOtpAwpNTrvLxLB+H2WGEZUFRFMC3NFCBI10vikXzewtVIiE124bMR6nyQwK0LH8xzB1qL8bR
	zyCBJnPgggC9VdPPH6UCkDlghbs3rlVLuRBZ8kg033D4acuMnMg==
X-Received: by 2002:a17:903:1a2c:b0:2b4:6470:760d with SMTP id d9443c01a7336-2ba78f473a2mr242876435ad.14.1778477738602;
        Sun, 10 May 2026 22:35:38 -0700 (PDT)
X-Received: by 2002:a17:903:1a2c:b0:2b4:6470:760d with SMTP id d9443c01a7336-2ba78f473a2mr242876025ad.14.1778477738092;
        Sun, 10 May 2026 22:35:38 -0700 (PDT)
Received: from [10.218.34.110] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d271b7sm88946045ad.14.2026.05.10.22.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 May 2026 22:35:37 -0700 (PDT)
Message-ID: <b66df3a8-bff7-40d2-b378-43235b79a8c3@oss.qualcomm.com>
Date: Mon, 11 May 2026 11:05:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] mailbox: qcom-apcs-ipc: Add Shikra APCS IPC
 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jassi Brar
 <jassisinghbrar@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
References: <20260508-shikra_mailbox_and_rpm_changes-v2-0-ab76fd9e71de@oss.qualcomm.com>
 <20260508-shikra_mailbox_and_rpm_changes-v2-4-ab76fd9e71de@oss.qualcomm.com>
 <n26qxqcft7rh24a77h454py2ye4kgzxiy6ib363vmuatp36mp6@otavb4hckcdw>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <n26qxqcft7rh24a77h454py2ye4kgzxiy6ib363vmuatp36mp6@otavb4hckcdw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA1NyBTYWx0ZWRfX1Eilygmn7l7a
 kBYCL7OnQmQgsNhB9OAOzc32Ifc3CfIhFxOogabrT5ezRBUHtCVagoFmRP4OwAFnM7Ah7UDi8F2
 1M+Qx1Kdlll00lMkJrhWr5pvv4T6Tu+wQNFyraIXl2b7oqPlqwaDnIjEAG9L8ddUK+AjOlcjdSK
 eiPVqwboe/G7fTtpvW0ESjI1/FVR0bKiSK6Dlgol/du5g13mlU7f6aGrsyD6UY1G4Ciu/p5PbxN
 Dfxgd4N+LzGQb3i9b+sWINQ+cZlK+kiQw45J02bvYd15BrLzqwFvw89C1Wte1L6UgryGDe8kOK1
 wjoXAJPc5BRtvRKvpElfg3g2DEjehbDobXAXFncyKiB/ETKWKYGPJX9J8V/2Giu3fdJqgXl5yvK
 g4QCUFGo74mcFpD/hLVkjUrwq+y8VHv5qwL/xPpnHipOu0n7wFjgWoM49LD6wv0kCa1bpg8JY/m
 UrLh2W7F9rI9rXZUfcA==
X-Proofpoint-ORIG-GUID: CRDxP1PgRbHM9j0Jlqfc3eR0K0EJZohu
X-Authority-Analysis: v=2.4 cv=UNvt2ify c=1 sm=1 tr=0 ts=6a016aab cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=f6HuTeiPA1jdPvv1JM8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: CRDxP1PgRbHM9j0Jlqfc3eR0K0EJZohu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110057
X-Rspamd-Queue-Id: 2AB8A5083CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,gerhold.net,gmail.com,vger.kernel.org,oss.qualcomm.com];
	TAGGED_FROM(0.00)[bounces-106837-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action


On 08-May-26 3:27 PM, Dmitry Baryshkov wrote:
> On Fri, May 08, 2026 at 12:49:50PM +0530, Sneh Mankad wrote:
>> From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>>
>> Enable Shikra APCS IPC support by adding the compatible.
>> It reuses apps_shared_apcs_data.
> With the DT bindings in place this patch is not required and useless.
Yes Dmitry, I realized that and had raised v3 without the driver side patch.

Thanks

Sneh

>> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
>> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
>> ---
>>   drivers/mailbox/qcom-apcs-ipc-mailbox.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> index d3a8f6b4a03b368821ef9a5b24fee78037104610..25f76965921ba695e3a1bf4df47ce643916a28cb 100644
>> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
>> @@ -168,6 +168,7 @@ static const struct of_device_id qcom_apcs_ipc_of_match[] = {
>>   	{ .compatible = "qcom,ipq8074-apcs-apps-global", .data = &ipq6018_apcs_data },
>>   	{ .compatible = "qcom,sc7180-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sc8180x-apss-shared", .data = &apps_shared_apcs_data },
>> +	{ .compatible = "qcom,shikra-apss-shared", .data = &apps_shared_apcs_data },
>>   	{ .compatible = "qcom,sm8150-apss-shared", .data = &apps_shared_apcs_data },
>>   	{}
>>   };
>>
>> -- 
>> 2.34.1
>>

