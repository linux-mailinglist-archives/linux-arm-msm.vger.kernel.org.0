Return-Path: <linux-arm-msm+bounces-77886-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D1BEDE1B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 06:19:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344CE189DE39
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 04:19:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83896150997;
	Sun, 19 Oct 2025 04:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAJ1lka+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7534C481CD;
	Sun, 19 Oct 2025 04:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760847568; cv=none; b=eTGXMkECBr5V/CZKJAPIFHcA/kD+Xc3EldChccfJ6jq+lqP25OrVhx1LPqVLKHrHxTxbL2YpZ4tYDesk/YPYbxXVGX3WBSBOaceu/e+HTYipWH4mgBSqSBdEOeACq8ys2gqPMLY0BYuvGXeZGHSbTk8qNlpW8q0kR1MrHJzUFGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760847568; c=relaxed/simple;
	bh=L1J/APi5QttnPnJDvU3/Cl6rl7Byi4rAM1I+p19t5bI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PR7pcfn3X/MIqVA/MZXuJvmFjP9nvOLil3d9HsP3Ln8qHKT9yCeZRhPm+pLQLfFpACxdUpLfxwWB1o5p6uxOvqQclTFkLrilcA9P0eLrDkILBrkjrtUsg0P1U52EbVbaqTlBqooaVmuyBlSH469qCJugpMbFFwCLHD1ZeWoyi6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAJ1lka+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760847567; x=1792383567;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L1J/APi5QttnPnJDvU3/Cl6rl7Byi4rAM1I+p19t5bI=;
  b=BAJ1lka+U9k5bFJTKzoSuvf8i39T6Ved9cWPw1m9dJZwzNi6NmMs9WY0
   oS2750Kv3+9vVNTY/9L68JF1obXaZKnaAKF16ABvNittg4KQCSWevmDIg
   npFNRMZRL/sE0QJ/RdNO589KkkypOoyfX6zDLHfA8hSrDSDH/n3oL44n5
   DIRZaJoaj21D0J7PCutgDpOd9xmCMM83S8PckAy/t9lJCsfpM5c6RrB2h
   9DxSU0S1qfDJo7vU+4xlhV+zHR3u3lWTD1GGQUY4PoWId9iaSJYzGWrqx
   d9xD3mHlyVgq/OZ1+lwtWFt/fAPXotrRXPlQlM5sZDjbHECCP1X7d8rcW
   A==;
X-CSE-ConnectionGUID: CKLwiWMeRTKnHabYMc+vmg==
X-CSE-MsgGUID: EFq0N+PfSSqKjAgAjd8e1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74449074"
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="74449074"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2025 21:19:26 -0700
X-CSE-ConnectionGUID: G59J5ty4SeK0DrIS7JPd0A==
X-CSE-MsgGUID: mKQtaGNZRe2UbEBOWR5E7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,239,1754982000"; 
   d="scan'208";a="183075634"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 18 Oct 2025 21:19:23 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAKt7-0008pR-09;
	Sun, 19 Oct 2025 04:19:21 +0000
Date: Sun, 19 Oct 2025 12:18:32 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	broonie@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, perex@perex.cz, tiwai@suse.com,
	srini@kernel.org, alexey.klimov@linaro.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH 12/12] ASoC: qcom: q6asm: Use guard() for spin locks
Message-ID: <202510191117.BTexj8De-lkp@intel.com>
References: <20251017085307.4325-13-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017085307.4325-13-srinivas.kandagatla@oss.qualcomm.com>

Hi Srinivas,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-sound/for-next]
[also build test ERROR on linus/master v6.18-rc1 next-20251017]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Srinivas-Kandagatla/ASoC-qdsp6-q6asm-do-not-sleep-while-atomic/20251017-170114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20251017085307.4325-13-srinivas.kandagatla%40oss.qualcomm.com
patch subject: [PATCH 12/12] ASoC: qcom: q6asm: Use guard() for spin locks
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20251019/202510191117.BTexj8De-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251019/202510191117.BTexj8De-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510191117.BTexj8De-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/soc/qcom/qdsp6/q6asm.c: In function 'q6asm_stream_callback':
>> sound/soc/qcom/qdsp6/q6asm.c:687:41: error: 'struct audio_port_data' has no member named 'hw_ptr'
     687 |                         atomic_set(&port->hw_ptr, token + 1);
         |                                         ^~


vim +687 sound/soc/qcom/qdsp6/q6asm.c

   590	
   591	static int32_t q6asm_stream_callback(struct apr_device *adev,
   592					     struct apr_resp_pkt *data,
   593					     int session_id)
   594	{
   595		struct q6asm *q6asm = dev_get_drvdata(&adev->dev);
   596		struct aprv2_ibasic_rsp_result_t *result;
   597		struct apr_hdr *hdr = &data->hdr;
   598		struct audio_port_data *port;
   599		struct audio_client *ac;
   600		uint32_t client_event = 0;
   601		int ret = 0;
   602	
   603		ac = q6asm_get_audio_client(q6asm, session_id);
   604		if (!ac)/* Audio client might already be freed by now */
   605			return 0;
   606	
   607		result = data->payload;
   608	
   609		switch (hdr->opcode) {
   610		case APR_BASIC_RSP_RESULT:
   611			switch (result->opcode) {
   612			case ASM_SESSION_CMD_PAUSE:
   613				client_event = ASM_CLIENT_EVENT_CMD_PAUSE_DONE;
   614				break;
   615			case ASM_SESSION_CMD_SUSPEND:
   616				client_event = ASM_CLIENT_EVENT_CMD_SUSPEND_DONE;
   617				break;
   618			case ASM_STREAM_CMD_FLUSH:
   619				client_event = ASM_CLIENT_EVENT_CMD_FLUSH_DONE;
   620				break;
   621			case ASM_SESSION_CMD_RUN_V2:
   622				client_event = ASM_CLIENT_EVENT_CMD_RUN_DONE;
   623				break;
   624			case ASM_STREAM_CMD_CLOSE:
   625				client_event = ASM_CLIENT_EVENT_CMD_CLOSE_DONE;
   626				break;
   627			case ASM_STREAM_CMD_FLUSH_READBUFS:
   628				client_event = ASM_CLIENT_EVENT_CMD_OUT_FLUSH_DONE;
   629				break;
   630			case ASM_STREAM_CMD_OPEN_WRITE_V3:
   631			case ASM_STREAM_CMD_OPEN_READ_V3:
   632			case ASM_STREAM_CMD_OPEN_READWRITE_V2:
   633			case ASM_STREAM_CMD_SET_ENCDEC_PARAM:
   634			case ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2:
   635			case ASM_DATA_CMD_REMOVE_INITIAL_SILENCE:
   636			case ASM_DATA_CMD_REMOVE_TRAILING_SILENCE:
   637				if (result->status != 0) {
   638					dev_err(ac->dev,
   639						"cmd = 0x%x returned error = 0x%x\n",
   640						result->opcode, result->status);
   641					ac->result = *result;
   642					wake_up(&ac->cmd_wait);
   643					ret = 0;
   644					goto done;
   645				}
   646				break;
   647			default:
   648				dev_err(ac->dev, "command[0x%x] not expecting rsp\n",
   649					result->opcode);
   650				break;
   651			}
   652	
   653			ac->result = *result;
   654			wake_up(&ac->cmd_wait);
   655	
   656			if (ac->cb)
   657				ac->cb(client_event, hdr->token,
   658				       data->payload, ac->priv);
   659	
   660			ret = 0;
   661			goto done;
   662	
   663		case ASM_DATA_EVENT_WRITE_DONE_V2:
   664			client_event = ASM_CLIENT_EVENT_DATA_WRITE_DONE;
   665			if (ac->io_mode & ASM_SYNC_IO_MODE) {
   666				phys_addr_t phys;
   667				int token = hdr->token & ASM_WRITE_TOKEN_MASK;
   668	
   669				guard(spinlock_irqsave)(&ac->lock);
   670	
   671				port =  &ac->port[SNDRV_PCM_STREAM_PLAYBACK];
   672	
   673				if (!port->buf) {
   674					ret = 0;
   675					goto done;
   676				}
   677	
   678				phys = port->buf[token].phys;
   679	
   680				if (lower_32_bits(phys) != result->opcode ||
   681				    upper_32_bits(phys) != result->status) {
   682					dev_err(ac->dev, "Expected addr %pa\n",
   683						&port->buf[token].phys);
   684					ret = -EINVAL;
   685					goto done;
   686				}
 > 687				atomic_set(&port->hw_ptr, token + 1);
   688			}
   689			break;
   690		case ASM_DATA_EVENT_READ_DONE_V2:
   691			client_event = ASM_CLIENT_EVENT_DATA_READ_DONE;
   692			if (ac->io_mode & ASM_SYNC_IO_MODE) {
   693				struct asm_data_cmd_read_v2_done *done = data->payload;
   694				phys_addr_t phys;
   695	
   696				guard(spinlock_irqsave)(&ac->lock);
   697				port =  &ac->port[SNDRV_PCM_STREAM_CAPTURE];
   698				if (!port->buf) {
   699					ret = 0;
   700					goto done;
   701				}
   702	
   703				phys = port->buf[hdr->token].phys;
   704	
   705				if (upper_32_bits(phys) != done->buf_addr_msw ||
   706				    lower_32_bits(phys) != done->buf_addr_lsw) {
   707					dev_err(ac->dev, "Expected addr %pa %08x-%08x\n",
   708						&port->buf[hdr->token].phys,
   709						done->buf_addr_lsw,
   710						done->buf_addr_msw);
   711					ret = -EINVAL;
   712					goto done;
   713				}
   714			}
   715	
   716			break;
   717		case ASM_DATA_EVENT_RENDERED_EOS:
   718			client_event = ASM_CLIENT_EVENT_CMD_EOS_DONE;
   719			break;
   720		}
   721	
   722		if (ac->cb)
   723			ac->cb(client_event, hdr->token, data->payload, ac->priv);
   724	
   725	done:
   726		kref_put(&ac->refcount, q6asm_audio_client_release);
   727		return ret;
   728	}
   729	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

