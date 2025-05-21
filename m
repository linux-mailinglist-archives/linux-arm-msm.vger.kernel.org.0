Return-Path: <linux-arm-msm+bounces-58823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8586ABE96B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 03:59:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75F764A6BCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 May 2025 01:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0697E221560;
	Wed, 21 May 2025 01:59:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011F728682;
	Wed, 21 May 2025 01:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747792752; cv=none; b=B8YdpEnEiWltyAwVvrgoHaYcn7D5+bpHfaS7A2wwIqJq3HOnB2NVctMvOuPdXzOiYkw/T/sUGDkMQu9LkgD3Jg79hLrRaQtPu9tSVSbLgd9FuayJvBDqAolgxo1CXFq1iqno6E+7Gwbx2DDC5yymSMQ7tbE3AWulgC/Z1t2+nPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747792752; c=relaxed/simple;
	bh=es0AFSkT/Gfkd0LgAlYkHnlG+OsOOKMTy+LrCQ8Awbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=MeBoP3reFs5htyk9qGpn4daImN+BoVkNvXw3PAHxShm8Qt/Zjv/0tBm3Ymhr0jAL0swprFmEoIjmMl4WhYlGgAJvh5RZa18uIpAkPQgaMB0YGaxdTkCztiRM2eQzhVFqUcl25+pzwiyzOCTyxVoLZYnxW9EJDJryA8gR3vbF2Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 28ab1d1e35e711f0b29709d653e92f7d-20250521
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_TXT
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME, HR_LANG
	HR_MAILER_MTBG, HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER
	HR_SJ_NOR_SYM, HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_PRE_RE, HR_SJ_WS
	HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NAME, HR_TO_NO_NAME, DN_TRUSTED
	SRC_TRUSTED, SA_UNTRUSTED, SA_LOWREP, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD
	CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_T1
	AMN_GOOD, AMN_C_TI, AMN_C_BU, ABX_MISS_RDNS
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:4a189c35-4ef7-4ed0-8ae9-4d6bd31c69f4,IP:10,
	URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:10
X-CID-INFO: VERSION:1.1.45,REQID:4a189c35-4ef7-4ed0-8ae9-4d6bd31c69f4,IP:10,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:10
X-CID-META: VersionHash:6493067,CLOUDID:b17d2cee544bb8cae19d49eb774a1492,BulkI
	D:250520172000LXPHKXCL,BulkQuantity:1,Recheck:0,SF:16|19|24|38|43|64|66|74
	|78|80|81|82|83|102|841,TC:nil,Content:0|50,EDM:-3,IP:-2,URL:0,File:nil,RT
	:nil,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:
	0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,TF_CID_SPAM_SNR,TF_CID_SPAM_USA
X-UUID: 28ab1d1e35e711f0b29709d653e92f7d-20250521
X-User: aichao@kylinos.cn
Received: from [172.25.120.86] [(112.64.161.44)] by mailgw.kylinos.cn
	(envelope-from <aichao@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 75421941; Wed, 21 May 2025 09:58:58 +0800
Message-ID: <758b0ad2-e337-4be6-a7da-4d5af8b193d1@kylinos.cn>
Date: Wed, 21 May 2025 09:58:54 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 srinivas.kandagatla@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, aichao@kylinos.cn
References: <20250520091131.4150248-1-aichao@kylinos.cn>
 <20250520091131.4150248-7-aichao@kylinos.cn>
 <eca8721c-305f-4053-8df0-0347cc869325@linaro.org>
Content-Language: en-US
From: Ai Chao <aichao@kylinos.cn>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <eca8721c-305f-4053-8df0-0347cc869325@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof :

     Thanks for your help.

     The for_each_child_of_node() function is used to iterate over all 
child nodes of a device tree node. During each iteration, it retrieves a 
pointer to the child node via of_get_next_child() and automatically 
increments the node's reference count (of_node_get()). Each call to 
of_get_next_child() increases the reference count (refcount) of the 
returned child node, ensuring that the node is not freed while in use.

     The of_node_put() function is used to decrement the node's 
reference count. When the reference count drops to zero, the kernel 
releases the memory occupied by the node.for_each_child_of_node() 
increments the child node's reference count in each iteration but does 
not decrement it automatically. If of_node_put() is not called manually, 
the reference count will never reach zero, resulting in a memory leak of 
the node.

On 2025/5/20 17:19, Krzysztof Kozlowski wrote:
> On 20/05/2025 11:11, Ai Chao wrote:
>> The for_each_child_of_node_scoped() helper provides a scope-based
>> clean-up functionality to put the device_node automatically, and
>> as such, there is no need to call of_node_put() directly.
>
> I do not see any of_node_put() there, so I don't understand what is the
> benefit of this and how this commit msg explains reason behind the change.
>
> Best regards,
> Krzysztof

