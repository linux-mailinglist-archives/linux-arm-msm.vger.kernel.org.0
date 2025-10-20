Return-Path: <linux-arm-msm+bounces-77973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CA213BF0897
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:29:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8D4924E6B0C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:29:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56A0B2F6585;
	Mon, 20 Oct 2025 10:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meHkDK4m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A213323C4FF
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760956176; cv=none; b=CSmT1FnU/mU+BZdjkF1UXW6LwaptCpmv2Djm6lNSH747vMklxiSP5Ib0Y3dJi4WpWNED92m6jS9WCaJLzCPOe5jE8Q4WJd+sfye65B+FX6RJlVMBqSBJ+5I1HcGFDmfQ9YqUiXBHq6NJRWrfcsAyt8TUuhSWkCKp4ks8hwUMiXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760956176; c=relaxed/simple;
	bh=tF962YWxw9azz7dtu4nHl90He2ajjnijFWcFDWZOG94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXl5zNo9aFqOLpfo6pqnnj/ZzCvi1p4um2VtByaJAYNVGUuiBNs+pnTnXEvdene02T5LIZLE/qBU8sltMn8eWQ5ZUFZB+25TlnCr5BN4IzQfOn76cXITj4YMu+gylh0N2BZVsFM81e8Z1oc0xBcneb5cpYwyhp9SH1cjltcjWHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meHkDK4m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59K0EqS5004761
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZOYhimoPa+lnW4TwlcuKOW72gVGLTvjPYcjxCfhdnFY=; b=meHkDK4m84xiKr/R
	jqhEBijt4O8HcU/PQ6SEOvKpGk/GarSBp03r5pNthCzcEal5rZuguJ4R2Q9AHfhM
	35kmYwttLikbdZfVkz2AXQ1xuGI1Ugci2B4i4CLJlIdyAPPZ4HKIu7Oo2AywGeco
	aosv5hrFGmcrPLYlq9tjymJpL3jIy4yHqrzDiDZqqzpJURUSh8iv1iVvTOZvNGt0
	YP9wN1/h+D+LVpJ+lp51nbxsC4OO1OyrYZCuOVGhvOpHwe5pJNb2QOR8FPGuh7pD
	os2s2tCE81f3vGlEHnwcphOt+Ppy6jamTrDdsiiZB8ptQIPtR8ptuiwNVljKEgpu
	DIyh3A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42k4b71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 10:29:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-89087f3817cso579421785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 03:29:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760956172; x=1761560972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOYhimoPa+lnW4TwlcuKOW72gVGLTvjPYcjxCfhdnFY=;
        b=mD9XTjZ5Yystkv9ba/xELtQ5hYnsBKj861lCkhlJcZA7t1i6eakpOxTfA5B8pAqASx
         q7wlnLSCmC15NpfrCw37zPWTjI6IY3R0yEyqsYMbutCgnaacfSjXJ4xHOtyN9ts2gNqU
         5/8TnlqPoXF2xuq36E4SOKeUCeFPLthcu4qQXpOHPau49wN3+DgPsw4E6ail8fN/v8Cm
         9BvrY3zjpU8IoVbVDGg5nM10NZSIWofQV3P+XSeLFTMtszpiEe3AEsAMQKWScoh0lrue
         /Z+zsosLdD+91vl1AdtcFX0UC9gfkrjqC+54Fj+6sWO2cYUWHl4xunKw5ytmk3EaqF2T
         HSaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCddokLisB0/K3dUvnWrJqetER/el301MJCs85J+V8qbXhN9Tnx7A7dix2Nt9FAVAknrBNk8Xk6NXIWQay@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4uNNtdKbFlBBeLcKU/Y8Kh0+g2knFsIE8rwMTCrxMv43U9IV8
	9T4Yb7vcCAktjs0UBVNRinndGkGr6jcard66kxAk16CZVpVaFwhvrCOGaxj8gjp6JEGZNPMPjkY
	Ki1KM531Ysn3nSd+ZAFHpZQDYZsZ52cCRBd7Mmg1mDdZ0Uir8VAmVYf7gteLJ7qn1XAS/
X-Gm-Gg: ASbGncsr45fa8ZD41IynUWQ8Y65DvxcDeEUYWGhElh2wzhKamrlCc70hZZoQYpxLCnD
	TcCo4Qifp/C8iZyywNfgDhLjZg7/fxIIJiCczFNPRQWrzzWZ+x7vYH4YaHaqCp1mZaweYyIIx4Q
	nJ9FeKiXqXQdz/U6D97bjLpq2CG1622VnCv06FxzQGsicA0vOxDYKDC/eSm0A1+Hs0v90a3mLqR
	zsRu/eui1wrR9qoRInJ1+JxUpeHHCdS+DY2e0z6WRoUfeAkPh8isJqpCLTRLDWEQp83RD4Xtgau
	vx+jRKJGMD4j0oDxD/iQBO95zVG0cY7TJkyeBvl1gTTSCumMDlVIwfZxGs6L7aj1ucitszYc0an
	lHmfMpV+Ul7R3wQLVBfJYCaT7fQ==
X-Received: by 2002:ac8:5881:0:b0:4c3:b7b0:3317 with SMTP id d75a77b69052e-4e89d35c473mr169196841cf.42.1760956172536;
        Mon, 20 Oct 2025 03:29:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlPMeN8JhZycGRui7S8uzF3Tp8ErxdFS7DePnTDJPvNaEZfwFYGHI+INI+m+Umf5wgVdvE/A==
X-Received: by 2002:ac8:5881:0:b0:4c3:b7b0:3317 with SMTP id d75a77b69052e-4e89d35c473mr169196491cf.42.1760956171904;
        Mon, 20 Oct 2025 03:29:31 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f009a6c5sm14830637f8f.28.2025.10.20.03.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 03:29:31 -0700 (PDT)
Message-ID: <cb6642c9-8a96-4843-933d-2321d6873719@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 11:29:29 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] ASoC: qcom: q6asm: Use guard() for spin locks
To: kernel test robot <lkp@intel.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, perex@perex.cz, tiwai@suse.com,
        srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251017085307.4325-13-srinivas.kandagatla@oss.qualcomm.com>
 <202510191117.BTexj8De-lkp@intel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <202510191117.BTexj8De-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: f_k_p_WrxKPHSRyZ-zqZgfWd9aHb5V3m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfXwYofxmV5XL+d
 Zt4A2WRaOEqoEPmn5F71eXfx1Hee2avwPSgHqW0i0yUXe8ez+QcrNXh2Pj2aechKkRL921tyrhm
 qgWdoVuvaV92/x7xoygkkOOTJqGAs0hJ5ZrZCYNSNJY28888eyJiQlGpYEH0LwByyYu/P9bt/PT
 Gnt+Act58+f5bbLH7x2svMgxa1Gt366/9YaMEYouGDI+psM0aTi+/7ZUBFAoxlPxPU2goobSnTZ
 T6syOdLzqgjof7U+RCZJQak8ty6HjWLMsUMbbrotvZ9wGTBJipQLh+tNlRZ5t1nuJ0u8e69//Io
 6/T8MkxNra5viJEwv2EOORDvO/oR+YTufiZSkR5EkSTFLrwR0cL+aL8pKVaLjhBPAPzKET7e49I
 nP/PJ97jLuWmoZGuExAJsWzfy9XRFg==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f60f0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=Pp1kaMlfcpgazL37F3AA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: f_k_p_WrxKPHSRyZ-zqZgfWd9aHb5V3m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031



On 10/19/25 5:18 AM, kernel test robot wrote:
> Hi Srinivas,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on broonie-sound/for-next]
> [also build test ERROR on linus/master v6.18-rc1 next-20251017]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-qdsp6-q6asm-do-not-sleep-while-atomic/20251017-170114
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> patch link:    https://lore.kernel.org/r/20251017085307.4325-13-srinivas.kandagatla%40oss.qualcomm.com
> patch subject: [PATCH 12/12] ASoC: qcom: q6asm: Use guard() for spin locks
> config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20251019/202510191117.BTexj8De-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191117.BTexj8De-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510191117.BTexj8De-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    sound/soc/qcom/qdsp6/q6asm.c: In function 'q6asm_stream_callback':
>>> sound/soc/qcom/qdsp6/q6asm.c:687:41: error: 'struct audio_port_data' has no member named 'hw_ptr'
>      687 |                         atomic_set(&port->hw_ptr, token + 1);
>          |                                         ^~
> 
> 
> vim +687 sound/soc/qcom/qdsp6/q6asm.c
> 
>    590	
>    591	static int32_t q6asm_stream_callback(struct apr_device *adev,
>    592					     struct apr_resp_pkt *data,
>    593					     int session_id)
>    594	{
>    595		struct q6asm *q6asm = dev_get_drvdata(&adev->dev);
>    596		struct aprv2_ibasic_rsp_result_t *result;
>    597		struct apr_hdr *hdr = &data->hdr;
>    598		struct audio_port_data *port;
>    599		struct audio_client *ac;
>    600		uint32_t client_event = 0;
>    601		int ret = 0;
>    602	
>    603		ac = q6asm_get_audio_client(q6asm, session_id);
>    604		if (!ac)/* Audio client might already be freed by now */
>    605			return 0;
>    606	
>    607		result = data->payload;
>    608	
>    609		switch (hdr->opcode) {
>    610		case APR_BASIC_RSP_RESULT:
>    611			switch (result->opcode) {
>    612			case ASM_SESSION_CMD_PAUSE:
>    613				client_event = ASM_CLIENT_EVENT_CMD_PAUSE_DONE;
>    614				break;
>    615			case ASM_SESSION_CMD_SUSPEND:
>    616				client_event = ASM_CLIENT_EVENT_CMD_SUSPEND_DONE;
>    617				break;
>    618			case ASM_STREAM_CMD_FLUSH:
>    619				client_event = ASM_CLIENT_EVENT_CMD_FLUSH_DONE;
>    620				break;
>    621			case ASM_SESSION_CMD_RUN_V2:
>    622				client_event = ASM_CLIENT_EVENT_CMD_RUN_DONE;
>    623				break;
>    624			case ASM_STREAM_CMD_CLOSE:
>    625				client_event = ASM_CLIENT_EVENT_CMD_CLOSE_DONE;
>    626				break;
>    627			case ASM_STREAM_CMD_FLUSH_READBUFS:
>    628				client_event = ASM_CLIENT_EVENT_CMD_OUT_FLUSH_DONE;
>    629				break;
>    630			case ASM_STREAM_CMD_OPEN_WRITE_V3:
>    631			case ASM_STREAM_CMD_OPEN_READ_V3:
>    632			case ASM_STREAM_CMD_OPEN_READWRITE_V2:
>    633			case ASM_STREAM_CMD_SET_ENCDEC_PARAM:
>    634			case ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2:
>    635			case ASM_DATA_CMD_REMOVE_INITIAL_SILENCE:
>    636			case ASM_DATA_CMD_REMOVE_TRAILING_SILENCE:
>    637				if (result->status != 0) {
>    638					dev_err(ac->dev,
>    639						"cmd = 0x%x returned error = 0x%x\n",
>    640						result->opcode, result->status);
>    641					ac->result = *result;
>    642					wake_up(&ac->cmd_wait);
>    643					ret = 0;
>    644					goto done;
>    645				}
>    646				break;
>    647			default:
>    648				dev_err(ac->dev, "command[0x%x] not expecting rsp\n",
>    649					result->opcode);
>    650				break;
>    651			}
>    652	
>    653			ac->result = *result;
>    654			wake_up(&ac->cmd_wait);
>    655	
>    656			if (ac->cb)
>    657				ac->cb(client_event, hdr->token,
>    658				       data->payload, ac->priv);
>    659	
>    660			ret = 0;
>    661			goto done;
>    662	
>    663		case ASM_DATA_EVENT_WRITE_DONE_V2:
>    664			client_event = ASM_CLIENT_EVENT_DATA_WRITE_DONE;
>    665			if (ac->io_mode & ASM_SYNC_IO_MODE) {
>    666				phys_addr_t phys;
>    667				int token = hdr->token & ASM_WRITE_TOKEN_MASK;
>    668	
>    669				guard(spinlock_irqsave)(&ac->lock);
>    670	
>    671				port =  &ac->port[SNDRV_PCM_STREAM_PLAYBACK];
>    672	
>    673				if (!port->buf) {
>    674					ret = 0;
>    675					goto done;
>    676				}
>    677	
>    678				phys = port->buf[token].phys;
>    679	
>    680				if (lower_32_bits(phys) != result->opcode ||
>    681				    upper_32_bits(phys) != result->status) {
>    682					dev_err(ac->dev, "Expected addr %pa\n",
>    683						&port->buf[token].phys);
>    684					ret = -EINVAL;
>    685					goto done;
>    686				}
>  > 687				atomic_set(&port->hw_ptr, token + 1);

Ah.. looks like left over from adsp patches

will remove this and send a v2.

--srini>    688			}
>    689			break;
>    690		case ASM_DATA_EVENT_READ_DONE_V2:
>    691			client_event = ASM_CLIENT_EVENT_DATA_READ_DONE;
>    692			if (ac->io_mode & ASM_SYNC_IO_MODE) {
>    693				struct asm_data_cmd_read_v2_done *done = data->payload;
>    694				phys_addr_t phys;
>    695	
>    696				guard(spinlock_irqsave)(&ac->lock);
>    697				port =  &ac->port[SNDRV_PCM_STREAM_CAPTURE];
>    698				if (!port->buf) {
>    699					ret = 0;
>    700					goto done;
>    701				}
>    702	
>    703				phys = port->buf[hdr->token].phys;
>    704	
>    705				if (upper_32_bits(phys) != done->buf_addr_msw ||
>    706				    lower_32_bits(phys) != done->buf_addr_lsw) {
>    707					dev_err(ac->dev, "Expected addr %pa %08x-%08x\n",
>    708						&port->buf[hdr->token].phys,
>    709						done->buf_addr_lsw,
>    710						done->buf_addr_msw);
>    711					ret = -EINVAL;
>    712					goto done;
>    713				}
>    714			}
>    715	
>    716			break;
>    717		case ASM_DATA_EVENT_RENDERED_EOS:
>    718			client_event = ASM_CLIENT_EVENT_CMD_EOS_DONE;
>    719			break;
>    720		}
>    721	
>    722		if (ac->cb)
>    723			ac->cb(client_event, hdr->token, data->payload, ac->priv);
>    724	
>    725	done:
>    726		kref_put(&ac->refcount, q6asm_audio_client_release);
>    727		return ret;
>    728	}
>    729	
> 


