Return-Path: <linux-arm-msm+bounces-97050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJyrC2i0sWnbEgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97050-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:28:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8821B26898F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 19:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D7B6315788F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 18:26:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718913E8696;
	Wed, 11 Mar 2026 18:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XUlAuIOg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD633E716A;
	Wed, 11 Mar 2026 18:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253615; cv=none; b=jW+VeADtgCPc4EdroEpci4H+mQtaco4vqnQx3/P1TAiRX19+SD2wriM75Xli3KxSk1UneiEAzUCzKOco0bsHmZqHQbsNZwg9cqHeyUqE9m2GN58SxkOqAhCrIerV1xxnWoCa6OdOd45hHIm3FuKgwMEh443+EPKo5qkegOKuBhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253615; c=relaxed/simple;
	bh=uLhWU+AZ6NFmcqPi+gIdjHiHih6E5Ri12T67mb5+E0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvmcfiDif99pWmZpa78zrEh3MioZoxYBLU2Hix2F9acuKcChxpcOmkSxMfPC72QpJAo/nEktjXrPksuPfNxWHRN80NuJaFJ22nhx2zya/EQ5Xp21PtmWA8r/CmzxrVAJJLVo3U6xfRm8/fOMJ7c9qIVTIRbekkd1gcrb7AgtI6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XUlAuIOg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773253613; x=1804789613;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uLhWU+AZ6NFmcqPi+gIdjHiHih6E5Ri12T67mb5+E0w=;
  b=XUlAuIOgzdxzSchnkqPMGboDvop/VeVZWNfjalFVAz3IdtWsTRSx5wHZ
   eIx74RayIq1JCYbD3Aym+w/1LFMHfVLo9PcB9DW/JZyJHpQi3IZBqFlEF
   RF1AkIuGMbtHDQqAv8DLJJRG6SAXQJ7dvuJtHhsWP4vstrqZQatvRjNlJ
   VX9nKSl/t4yq3Pr3r5mZ7wjacB7x/3CK0uWpxkYfrUflzvBTvIRdoBG+j
   SR7Xqr8lCelz5lHVOWVMNZ0CRGISAeqFj6JmqrjpnhEPCXBdGTdsq+FNl
   z2QpWCIqH3ULQMo5871jkLh0POAYFPBZQNu3XVDWKEL+u7sWxG+Ijlly0
   w==;
X-CSE-ConnectionGUID: fiGPK+63QWuDi9R6ZiswhA==
X-CSE-MsgGUID: lE/KwbBaSbi3oB3pWJ3DaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74414704"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74414704"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 11:26:52 -0700
X-CSE-ConnectionGUID: SbtVNq32RuWx19m5q3vrTQ==
X-CSE-MsgGUID: TZouXnOLRAG2W6IqUeyUFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="218030614"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Mar 2026 11:26:49 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0OGc-000000001Zv-2qlK;
	Wed, 11 Mar 2026 18:26:46 +0000
Date: Thu, 12 Mar 2026 02:25:48 +0800
From: kernel test robot <lkp@intel.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
Message-ID: <202603120247.NRy9LSop-lkp@intel.com>
References: <20260309111300.2484262-4-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309111300.2484262-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97050-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Queue-Id: 8821B26898F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mohammad,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a0ae2a256046c0c5d3778d1a194ff2e171f16e5f]

url:    https://github.com/intel-lab-lkp/linux/commits/Mohammad-Rafi-Shaik/ASoC-dt-bindings-qcom-q6apm-lpass-dais-Document-DAI-subnode/20260309-191956
base:   a0ae2a256046c0c5d3778d1a194ff2e171f16e5f
patch link:    https://lore.kernel.org/r/20260309111300.2484262-4-mohammad.rafi.shaik%40oss.qualcomm.com
patch subject: [PATCH v1 3/4] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock control
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260312/202603120247.NRy9LSop-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260312/202603120247.NRy9LSop-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120247.NRy9LSop-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:298:2: warning: variable 'sysclk' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
     298 |         default:
         |         ^~~~~~~
   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:302:6: note: uninitialized use occurs here
     302 |         if (sysclk) {
         |             ^~~~~~
   sound/soc/qcom/qdsp6/q6apm-lpass-dais.c:281:20: note: initialize the variable 'sysclk' to silence this warning
     281 |         struct clk *sysclk;
         |                           ^
         |                            = NULL
   1 warning generated.


vim +/sysclk +298 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c

   277	
   278	static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
   279	{
   280		struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
   281		struct clk *sysclk;
   282		bool *enabled;
   283		int ret = 0;
   284	
   285		switch (clk_id) {
   286		case LPAIF_MI2S_MCLK:
   287			sysclk = dai_data->priv[dai->id].mclk;
   288			enabled = &dai_data->priv[dai->id].mclk_enabled;
   289			break;
   290		case LPAIF_MI2S_BCLK:
   291			sysclk = dai_data->priv[dai->id].bclk;
   292			enabled = &dai_data->priv[dai->id].bclk_enabled;
   293			break;
   294		case LPAIF_MI2S_ECLK:
   295			sysclk = dai_data->priv[dai->id].eclk;
   296			enabled = &dai_data->priv[dai->id].eclk_enabled;
   297			break;
 > 298		default:
   299			break;
   300		}
   301	
   302		if (sysclk) {
   303			clk_set_rate(sysclk, freq);
   304			ret = clk_prepare_enable(sysclk);
   305			if (ret) {
   306				dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
   307				return ret;
   308			}
   309	
   310			*enabled = true;
   311		}
   312	
   313		return ret;
   314	}
   315	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

