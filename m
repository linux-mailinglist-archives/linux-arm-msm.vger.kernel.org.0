Return-Path: <linux-arm-msm+bounces-92922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHgUOrL6kmlx0gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:08:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F3F142AD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 12:08:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3125C3002E07
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 11:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BE052C21EB;
	Mon, 16 Feb 2026 11:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oiPYhh5T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fORObqhu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADCF2652B7
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771240111; cv=none; b=cD29VBlQIIEXeBzGvzM5JbWxgVwO2G2Sxu9OAlnwXazCZIzkpxMLUIC3I+8RAnVfUFPIDX0s8/lpBFVd17pjQOoNEekHM78os3K4Wqq2Lnw+aYFAF9JPFcsBqL/i1wg1jMK3LPF5qSmbvitauYPfWGjKTS0oJZJNXsfr7v71H5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771240111; c=relaxed/simple;
	bh=o3ji8ikpSHb30KCcUJOyKO/J/sk4HuPnH5JXHFOM2lc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3+NS6FV+ltR/Opkxvg8QX488yHMx/UCL+SW0GJqv9txG+mxh53bEPoyYYB66dqr2Eb+ObYqrOUWj9qRYfqKhBrN95ix9vJekrZ1D7zQt4xXNAvmWVMsuPI0MzZjYfwb3pUakUzcSnTWM+Wf4uQfp4bbbnOFNOJkbbhTihHbojs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oiPYhh5T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fORObqhu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G7l5Pi850451
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qQL+pFG63JDiXngr1sR9R3WtgDi2LDQphCbXmKzPr0c=; b=oiPYhh5TaJXW7iMj
	La0ivJN3nLt9RDP5Io4FGGH2GabPKg6RntoldgOleNB4F4BRKMRIhvFFnAJII68e
	eHTZ0sdKvEp4qhMXERv6m1pQkTimzUWYB3WjF8SBhz3ZjJItsj/oPpWlk8auEq9+
	0oTZ7Gnd0Merv3A/L9NU3ZJp/6yV5Fc/1drazGTZ0Xy+j9hIIQrKXyCjAxlJk968
	x+z+33XkRUYRHessQqhJNvJ4ULxoIEC//Pfu5q3QC5fgg2X/EPwUhpuxEe0riUXd
	2dlWucvXRoDlXQ2uaSv8hSHcd0K4zuubVJDwGE9jvcgSr5Ckw6oNtVKwSwCvR4AA
	gmOSYQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cb6bujjmh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 11:08:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-506a3dde543so24640981cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 03:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771240109; x=1771844909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qQL+pFG63JDiXngr1sR9R3WtgDi2LDQphCbXmKzPr0c=;
        b=fORObqhuUflkxlxVK5Va5/dsiliOz2LSEtR3b8hrg5Llbsha1uBIcFKt3cz6uH0vKf
         glTDFe8/+jGdzP/WcxU5f7hLmfbCmJJknZXOPyBJT17VcMCTux3h6u+doGiEo/ZAGI8y
         PENQLp5q5v13difyhUW31lj8+InfRcf1dZxzInT1FFzq2Lzd8WpQyB+WSykM4vp8ChJb
         xhEI2leE3s+vkgnBp70KxbUbrtZ72cv+k8022biJJ/ZTH6eCNKqFeekWckIRV4LP6/5V
         Qu42YzYzULWCp2gLSvCUjet74wngRfL2NyBFgbGZOXzqiRJk0p7KmU624Dki+xMCboYF
         oWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771240109; x=1771844909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQL+pFG63JDiXngr1sR9R3WtgDi2LDQphCbXmKzPr0c=;
        b=EnGmcVsV2A4naPfxiX1TlprEh9Txlqb9PU4aVoe2iirMpJ22XARknDxRtJ2/bcdpPJ
         198Mpi0Qanv0MhZcc+f/PDr5fcicgPEx9XsTQiXsuuTsLNLTGUApbp4noWuhfnpjfy4R
         /n2eAUq0P6+EpVMwLCxFzMXH1YS9xXwVRXLPscuDalHr0qe2v/H9LdbM19UC5xTjexp5
         NQbLcFH95Mk6qZ2owuHMFmTXa+oqG7NhX7h7dB+7Ln+8Tn34mPITjBkD4ef0NccBOvLX
         rKr/oHmeIz54mbhRSHAw+vCSxvlRPZKQbLVPsYN4avGjXCHlUSNVdr7HJo6YUMXJs0tI
         fm2w==
X-Forwarded-Encrypted: i=1; AJvYcCU3Va+JjsLezzQFodQdhoxvF8+DeRl9ajVJAGhGOPYd6SDpUPJ2LtdBZLM+p1fPtNmdQfQkqZhSnQmCsjIZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwRM9FXm5VqNalaDAqR2ZtowA9dBQxMbJSk5szxi5wwTSO4TfHO
	oFDvCAzZv0VwSmmKX9APmzLIuL5/VJvtVzNqVOMVEi5p6CGpEuG8Qanl5iHqCVNOwkzVdf/xCqQ
	BXR8M1/TrTr1V5csMRAE8xDMBL2iizFiSz3Vgt8uP5I2PnngNYvnK+IGibg6UpL7MyX9Q
X-Gm-Gg: AZuq6aLpeOfKNfPsTsW5nGSYxYnCXyIAbi0DMWiPdJOtXR0WFMn9XKWQ2o9ys5Sa2bu
	8zaFUBWeU3iq0XoIQiY0o3X9UPDxLyOwXzAweQPkwPlbcnHh9FCPpeQKgAYFope8RBMySIKvFmS
	mZC4WxlOOGDf6pcjFbUoP4ED95iZ1EJtZgcwmpHRwzJECCspf5QAyRUrTVeOS001C2n2Ml/3C0m
	FbOzQXfSwzd/16FhpYXIs+H1YMBMyX9Nh0Phpek07pPTW+k5jnpXTVDVu/7Pookdi4fC1vO9Y9A
	y8zQKwjeYVQDuJjsZli0uYFG/tcgLulMSOFoTa1lwHEgNcpwGoJKiP1iUK+mPpo0Tcs9zKBZOS0
	x1ep9qhLD9qGTCi/Y4CiHy79769svbSsGcpD8HuiOsG6wWm2eUFdPAXbVJjZhvqPd5C/edPhpfp
	Gb1nM=
X-Received: by 2002:ac8:5ccb:0:b0:506:bb3d:384c with SMTP id d75a77b69052e-506bb3d4c96mr67700861cf.10.1771240108728;
        Mon, 16 Feb 2026 03:08:28 -0800 (PST)
X-Received: by 2002:ac8:5ccb:0:b0:506:bb3d:384c with SMTP id d75a77b69052e-506bb3d4c96mr67700581cf.10.1771240108211;
        Mon, 16 Feb 2026 03:08:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e39ebsm1793360a12.18.2026.02.16.03.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 03:08:27 -0800 (PST)
Message-ID: <1e7adc39-8e85-4c59-a47c-7850f6c53e70@oss.qualcomm.com>
Date: Mon, 16 Feb 2026 12:08:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
To: kernel test robot <lkp@intel.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
References: <20260215182136.3995111-3-ekansh.gupta@oss.qualcomm.com>
 <202602161009.M2K52X34-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202602161009.M2K52X34-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AKHD6mSIljmKcci3pz-wITfj_ZAGMgUP
X-Proofpoint-ORIG-GUID: AKHD6mSIljmKcci3pz-wITfj_ZAGMgUP
X-Authority-Analysis: v=2.4 cv=M8dA6iws c=1 sm=1 tr=0 ts=6992faad cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=anyJmfQTAAAA:8 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=JNKdrcoTLt_OEecmFUQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA5NCBTYWx0ZWRfXxQV4RhXv9hYx
 inwT48QeAMio8fxDzNTBuilfBPx3ySi+Q8GYdfT1BvIyJtYF41p8umpj4LG9vHYK39xeTUBPqWK
 vLjUptKfkxMQEptgYjvqlH/Vf0zDV+ROgiJTnoYyBs4pbKC+TBCS2AzJtv9vUIZS+jLSenQx/3S
 y/6bUIpHKgeZSErqOIFQmO/sOSl7s2lfP8wie9AWZQO69AGFS/qHd3aFDA3TqwSkZJnL5lVZJQ8
 SuqoNvu8H1hs0HEE1S5T0378lkgJnegoYU571Iu6sW+EiB9T2euTjP8lji6T0jAWlVQoeqPmlIW
 YpWhDmJYs/r/WQPiKsIIO4tOkl0vVB9X+SxDfVx8S+nAxnUVaMMy2CSZ0yj6TKQvWlKKVvJ4S3y
 rE+/K34Pkd7gpXpPCRnderlAklA7pJ5E3MPGEPJJF0U/v5/XkFbeH8Rw662mJGYZMfGzKI5GRQ5
 +jpO+Ift6Rjbg4bPfFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_04,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92922-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,01.org:url,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 63F3F142AD3
X-Rspamd-Action: no action

On 2/16/26 3:39 AM, kernel test robot wrote:
> Hi Ekansh,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on char-misc/char-misc-testing]
> [also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.19 next-20260213]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Move-fdlist-to-invoke-context-structure/20260216-022305
> base:   char-misc/char-misc-testing
> patch link:    https://lore.kernel.org/r/20260215182136.3995111-3-ekansh.gupta%40oss.qualcomm.com
> patch subject: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
> config: hexagon-randconfig-001-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/config)
> compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602161009.M2K52X34-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> drivers/misc/fastrpc.c:518:29: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>      518 |         idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));


#include <linux/bitops.h>

Konrad

