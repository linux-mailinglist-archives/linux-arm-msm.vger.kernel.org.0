Return-Path: <linux-arm-msm+bounces-78122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EC2BF5732
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81966480CB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07FB632A3FD;
	Tue, 21 Oct 2025 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CkiUHRjT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3228C32AAB6
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037972; cv=none; b=ExJ9NrdCCFKC4nj/o0mfsBLrP/RhFti1CNyhIOU+Py4s8UnwssHI4V4a2z0sLjtg7jOZKwqLx71qc2BH8jRcMvfaRmxLwZe58yW1sFEp7ki35mAiMYuTZSU0VbzZyQ4u1a1nXHXBVRcIzQyXyOwd2nf72Pli8AH/QzDFfbDKris=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037972; c=relaxed/simple;
	bh=6rTGg0kviAjZ0sMZpgzO+M8jOeAgPPwVJHKwD6xbFWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFfzcvyLY4FEsu5/kXm5QUG2AcM7TdKfVw0WVeP/rSG/LbHUl1O7AsJFRE9bqqael54FjyP8JnGKoulmcVf841fRdCzc/bqEVStZt7zOFf+94r6QK2JnNwMHv1Rji2q9Ty0iVwVu1TsRxr6JmSvoh+D/HrCk2dImKwR7yohy9XQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CkiUHRjT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8HLPH024689
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ycFnOmcQPOQTi8cKwIToNBlKvB79YJZOE72yed14ZhU=; b=CkiUHRjTJaGUmUqy
	7/L7aLU8G2fLrm0u6XoTKguk4qVgGIAIXoxMGL9fGQemsZRz6BMN1XC53KkBCtxx
	nwWcAkW089OK0kvHEVkBQbVoptvyrAZpAeu2e+Gx/9aP2R1QaOg4bmybqpTCrXNc
	Rz4wU36+46TTAFmo7bHMEwUYxi84Bn1RKdDFDObOxbuLChX4VpwFw8cBIBzWdaV8
	1pbLvtJ+PggglEupiyFF/BXd7PALB1vcwKgod4BQcUWn+7jSiJydgJsfvIUCeGSt
	ciTKkQI50Xn0tfi8S6WxIlgyp2stz36ooFNPTYUIbUV5sgQbFXhtJJTQcIz2Msia
	NDF0RQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49wsws2g27-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:12:49 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c28cecb4cso14080936d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761037969; x=1761642769;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ycFnOmcQPOQTi8cKwIToNBlKvB79YJZOE72yed14ZhU=;
        b=pDZeYUeNG7t6eggy2J3+4La8GRKyjqSCRtllGHXEogzME9AnnilGZLsgeoUjMwyLNz
         rNBcZu6/Spo1W1snuaK80zYFu7iOrayVdkoJk9fcn9+5uGmseKKpFac3Ay3uduj1CROh
         USj8dVL5gbJbq5v5s/PoOIR0WtZxPnhxVbRvjkAh6nvkOsNUDC70jnldJIMrdc5Sh+UM
         YTTOyIQyRF340T2szEYsq6UwTY9u5fGC6hrbMilTchrAutF+3kMYONW5njO6zmXM7J9N
         rtxTMKZOVLz3gsW0eRnRqDEeCLR+Xxo0KtXh6DhXox3Mlq3mV1zS7/RZzgf8eBHq4K6Q
         ntLw==
X-Forwarded-Encrypted: i=1; AJvYcCWaqO7rx7U/KOhviPLAIWaqu+MMFGkskFskYb2XY1RhbScz5F6I/aun60QHoMcObZ7pkGhqsGmYOylFaOoS@vger.kernel.org
X-Gm-Message-State: AOJu0YzCltUJDmY7YgC4NFQLhQGVueosD6fLnwYk06nFsdnV8p4SuKLh
	RxfkRILgF/MVlkGP395WkT333yg4EAHZ8KoHiBTKjCxaI6zqKkRBI+iLjm6dJc9dPx7GzLw6C9K
	zTgHMWk0wv1CYXopjuoB3XOqhO9nIOJVTiN2Ryj2H2fzoEf2jCNl0mtOrtQnuJX+7ozsl
X-Gm-Gg: ASbGncuuLB7FsyIzhXyC+QTStNrHW1H77psxCgqh2doQk2QmTYzUgGKwV+DJWXPcvM+
	z+qkh90aXK3RNWbPqB2Vv1qHF/rbIRkWFHgPCXkCCUOGR/9Wccu/MwNAsvNlePz2HTDDBOdN144
	KRo3ebDjnrBi0PwwXY/9zEWftLtV6/U7i6gF8iswEzZlMO8fQPHHBp4uXVGpgFM/o0y42TzWJp9
	LRuaaJhz1Yrs0xKEIGtdVpDCyNULtBN8G9YaGCq+fptlNBgGlCSNWHZbGF70sYIIgN2oYT0kTna
	e0KUpTCr3AA5vuIAvQ1YMu9AxN+kVNX1IL/Azq8+qjEihTeHBSx5T4lYbrzVxlO/krNI/wuM7PL
	DcUuyLk23pQTA5qvf/JMqvpWKuMUoyWcxChcoepUj2CmA7EzfpI1mdj6o
X-Received: by 2002:a05:622a:1ba0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ea116a557dmr17933291cf.5.1761037968986;
        Tue, 21 Oct 2025 02:12:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi9hWrOE70Mvz5VgNCyLneioz+UgdPn5F9UZxHgWQMUlXhnZ+jTnSgJXtgJitCLor7Slq9Ww==
X-Received: by 2002:a05:622a:1ba0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ea116a557dmr17933111cf.5.1761037968391;
        Tue, 21 Oct 2025 02:12:48 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab54fbsm8678965a12.15.2025.10.21.02.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:12:47 -0700 (PDT)
Message-ID: <168c9cee-5f5b-4c45-82bd-45c911da4dd4@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:12:45 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] ASoC: qcom: q6asm: handle the responses after closing
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>, broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251015131740.340258-6-srinivas.kandagatla@oss.qualcomm.com>
 <DDN83LOTCUIP.5O05FBN02AZB@linaro.org>
 <7c0dad34-cb4c-4912-9406-2e559b91142a@oss.qualcomm.com>
 <60a48dfb-e266-425d-8cfb-574c637f5e9d@oss.qualcomm.com>
 <97afc64d-b384-4edb-9665-a5d654c19771@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <97afc64d-b384-4edb-9665-a5d654c19771@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDE0OCBTYWx0ZWRfX3NQQaQD35axf
 Nrjr4hRHmavDG4LCTMjzujgv/+h949cIxInYbhN3Q4GtkvkFRDBwH5Udv/GyyAuZXV/xWTUab6v
 hyZwVxC0qR6ksm5jybxqCAkA9ALrZGkGXrm8h06uOwWqo2G3F81xWMugqGQi84edwnDJ60YFOYE
 DmJ+3Knd1sd6nrrxACX8Vxse+wKtECnMHP5pvFta4kWQYDV0nmO9vjs5Hs42OnXS7Fuq/45V9Ts
 VlcxUCxNnjvqzxZ2KQlYvp6xBO6b7nuonBdFs0ndRoCW0/nAQX1cXuiUdlXkNOqILkN40QquGK7
 RjwMIPOCg80knrsqN5lLaynTp//szB4I6ZN7N37Jer3yjNk/E2X/3GEzTwaNFPexzvNW+SItpYL
 1PUddNw6qJlofllL6vpkXwFtAeh4Fg==
X-Proofpoint-GUID: D2uLdE9NYAd1sj_RdzFl-uwetFAmqWw0
X-Proofpoint-ORIG-GUID: D2uLdE9NYAd1sj_RdzFl-uwetFAmqWw0
X-Authority-Analysis: v=2.4 cv=a+E9NESF c=1 sm=1 tr=0 ts=68f74e91 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZPye_HHLVG_tTj0NC3MA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510200148

On 10/20/25 4:42 PM, Srinivas Kandagatla wrote:
> On 10/20/25 3:39 PM, Konrad Dybcio wrote:
>> On 10/20/25 4:37 PM, Srinivas Kandagatla wrote:
>>> On 10/20/25 3:35 PM, Alexey Klimov wrote:
>>>> On Wed Oct 15, 2025 at 2:17 PM BST, Srinivas Kandagatla wrote:
>>>>> For record path, multiple read requests are queued to dsp in advance.
>>>>> However when data stream is closed, the pending read requests are rejected
>>>>> by the dsp and a response is sent to the driver, this case is not handled
>>>>> in the driver resulting in errors like below
>>>>>
>>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>> q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: command[0x10dac] not expecting rsp
>>>>>
>>>>> This is same for both write and eos.
>>>>>
>>>>> Fix this by allowing ASM_DATA_CMD_READ_V2, ASM_DATA_CMD_EOS and
>>>>> ASM_DATA_CMD_WRITE_V2 as expected response.
>>>>>
>>>>> Reported-by: Martino Facchin <m.facchin@arduino.cc>
>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>
>>>> I was also reporting this error months ago.
>>>> Thanks for fixing this.
>>>>
>>>> FWIW there is also DSP timeout error on Audioreach-based platforms.
>>> there should be only one for SPF get state command.
>>>
>>> qcom-apm gprsvc:service:2:1: CMD timeout for [1001021] opcode
>>>
>>> This is expected as we are checking for DSP readiness and it will
>>> timeout if the dsp is not ready.
>>
>> Can we make the UX better by adding "bool timeout_expected" in the
>> path that we "want" it to fail?
> its not that we want it to fail, its just that we might fail, if we send
> the command too early.

I came up with this to potentially work around it, but it seems a little
heavy-handed to avoid a single line in dmesg..


diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 2365424a9b42..a39e717cb4e0 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -552,7 +552,7 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_graph_pkt);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
                             struct gpr_ibasic_rsp_result_t *result, struct mutex *cmd_lock,
                             gpr_port_t *port, wait_queue_head_t *cmd_wait,
-                            struct gpr_pkt *pkt, uint32_t rsp_opcode)
+                            struct gpr_pkt *pkt, uint32_t rsp_opcode, bool silent_timeout)
 {
 
        struct gpr_hdr *hdr = &pkt->hdr;
@@ -579,7 +579,10 @@ int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev,
                rc = wait_event_timeout(*cmd_wait, (result->opcode == hdr->opcode), 5 * HZ);
 
        if (!rc) {
-               dev_err(dev, "CMD timeout for [%x] opcode\n", hdr->opcode);
+               if (silent_timeout)
+                       dev_dbg(dev, "CMD timeout for [%x] opcode\n", hdr->opcode);
+               else
+                       dev_err(dev, "CMD timeout for [%x] opcode\n", hdr->opcode);
                rc = -ETIMEDOUT;
        } else if (result->status > 0) {
                dev_err(dev, "DSP returned error[%x] %x\n", hdr->opcode, result->status);
@@ -600,7 +603,7 @@ int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pk
 {
 
        return audioreach_send_cmd_sync(graph->dev, NULL,  &graph->result, &graph->lock,
-                                       graph->port, &graph->cmd_wait, pkt, rsp_opcode);
+                                       graph->port, &graph->cmd_wait, pkt, rsp_opcode, false);
 }
 EXPORT_SYMBOL_GPL(audioreach_graph_send_cmd_sync);
 
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index d1b60b36468a..55ce1e367cda 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -805,7 +805,7 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph,
                                  bool is_contiguous);
 int audioreach_send_cmd_sync(struct device *dev, gpr_device_t *gdev, struct gpr_ibasic_rsp_result_t *result,
                             struct mutex *cmd_lock, gpr_port_t *port, wait_queue_head_t *cmd_wait,
-                            struct gpr_pkt *pkt, uint32_t rsp_opcode);
+                            struct gpr_pkt *pkt, uint32_t rsp_opcode, bool silent_timeout);
 int audioreach_graph_send_cmd_sync(struct q6apm_graph *graph, struct gpr_pkt *pkt,
                                   uint32_t rsp_opcode);
 int audioreach_set_media_format(struct q6apm_graph *graph,
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 0e667a7eb546..f96c0ae20eb2 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -34,7 +34,16 @@ int q6apm_send_cmd_sync(struct q6apm *apm, struct gpr_pkt *pkt, uint32_t rsp_opc
        gpr_device_t *gdev = apm->gdev;
 
        return audioreach_send_cmd_sync(&gdev->dev, gdev, &apm->result, &apm->lock,
-                                       NULL, &apm->wait, pkt, rsp_opcode);
+                                       NULL, &apm->wait, pkt, rsp_opcode, false);
+}
+
+static int q6apm_send_cmd_sync_may_timeout(struct q6apm *apm, struct gpr_pkt *pkt,
+                                          uint32_t rsp_opcode)
+{
+       gpr_device_t *gdev = apm->gdev;
+
+       return audioreach_send_cmd_sync(&gdev->dev, gdev, &apm->result, &apm->lock,
+                                       NULL, &apm->wait, pkt, rsp_opcode, true);
 }
 
 static struct audioreach_graph *q6apm_get_audioreach_graph(struct q6apm *apm, uint32_t graph_id)
@@ -154,7 +163,7 @@ static int q6apm_get_apm_state(struct q6apm *apm)
        if (IS_ERR(pkt))
                return PTR_ERR(pkt);
 
-       q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_GET_SPF_STATE);
+       q6apm_send_cmd_sync_may_timeout(apm, pkt, APM_CMD_RSP_GET_SPF_STATE);
 
        kfree(pkt);
 
diff --git a/sound/soc/qcom/qdsp6/q6prm.c b/sound/soc/qcom/qdsp6/q6prm.c
index 81554d202658..7b71d6dfc993 100644
--- a/sound/soc/qcom/qdsp6/q6prm.c
+++ b/sound/soc/qcom/qdsp6/q6prm.c
@@ -52,7 +52,7 @@ struct prm_cmd_release_rsc {
 static int q6prm_send_cmd_sync(struct q6prm *prm, struct gpr_pkt *pkt, uint32_t rsp_opcode)
 {
        return audioreach_send_cmd_sync(prm->dev, prm->gdev, &prm->result, &prm->lock,
-                                       NULL, &prm->wait, pkt, rsp_opcode);
+                                       NULL, &prm->wait, pkt, rsp_opcode, false);
 }
 
 static int q6prm_set_hw_core_req(struct device *dev, uint32_t hw_block_id, bool enable)

Konrad

