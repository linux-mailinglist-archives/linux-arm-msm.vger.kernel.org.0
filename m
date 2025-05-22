Return-Path: <linux-arm-msm+bounces-59055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BECAC0D84
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 16:04:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34DE0A220C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 14:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2CC2620DE;
	Thu, 22 May 2025 14:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIjrUFAK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B96928C015;
	Thu, 22 May 2025 14:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922651; cv=none; b=P20k/gJxdwS+scxOtolXuPPDPWXXezNqQqSnlygtHGht677KDXVPSlcxa/FndYvdYxpcDjp/QajWh/AtMhz7xJLVSHdFVrYP7cFe5+8U+LBhSsdXQi0WZgr7QosA/OQNHLYgNKcMZhuvlBTOOLc1tR98wBvrDsqffupPZxz35Gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922651; c=relaxed/simple;
	bh=gaVhOROGrfN2y5e11GTj0NSjXZTkCP3N2RkrF3r87Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkLEbtL3XDjgzpIBlaPBPKlEVwBgpCTMow8/YrCa9CLClzrFeYCuQEEx44JmnhJbZq/64n7tMurbL2W8PAhLk+EXsVuAeB19gSkD5u8EZgfkvcHdCxReQdgO1TBITaesOj8KeYMaqaoF5MfpZ3I8koz3MtrVQc6nMdxbqyMX9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIjrUFAK; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747922648; x=1779458648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gaVhOROGrfN2y5e11GTj0NSjXZTkCP3N2RkrF3r87Uw=;
  b=jIjrUFAKJxqBHRwA7xK76g+qyGmbx8ziUrbLUtJbRRa4GlyhejSoVFkj
   oJ2Q5yEqd75KBCbZAeGNg1jxVOWyRPwbZs3zuqCyA5HfLyfIbZg3mA3ny
   pLLyb25W3O7COnhSiv50AnIWPQSkOgvw6FFeZdL74hSQ/qY4VhZcUIGB7
   QU5njHKmq/FSdja7jzDE6znxOZ/rJ7B8XCuL8GgdN47xiwNp3MuNakfOI
   GdxYYlbXTJlhprhOQg69s4Rq8dm4O/BkT3swDqR7vn50968qfVNBY9Rb2
   E2Gi4bEMNI+QGEj959XycENTWmggsAwDT59Gu+93wn2ANEhLkT1Dp7Ysw
   Q==;
X-CSE-ConnectionGUID: YPN+j42wRnO9BtiTjlNWWA==
X-CSE-MsgGUID: 1avFidFSSuu0lQqKV9qlQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49944410"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49944410"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 07:03:54 -0700
X-CSE-ConnectionGUID: EbxyZ75ZSg6LJ8butZLGqw==
X-CSE-MsgGUID: 91H7rSN0RQa+6dJLZGYsTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="177746893"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 22 May 2025 07:03:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI6WT-000PP6-0t;
	Thu, 22 May 2025 14:03:49 +0000
Date: Thu, 22 May 2025 22:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: QMI encoding/decoding for big endian
Message-ID: <202505222118.Hv5tsNGQ-lkp@intel.com>
References: <20250521092554.1026716-2-alexander.wilhelm@westermo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521092554.1026716-2-alexander.wilhelm@westermo.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.15-rc7 next-20250522]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Wilhelm/soc-qcom-QMI-encoding-decoding-for-big-endian/20250521-172849
base:   linus/master
patch link:    https://lore.kernel.org/r/20250521092554.1026716-2-alexander.wilhelm%40westermo.com
patch subject: [PATCH 1/2] soc: qcom: QMI encoding/decoding for big endian
config: csky-randconfig-r132-20250522 (https://download.01.org/0day-ci/archive/20250522/202505222118.Hv5tsNGQ-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250522/202505222118.Hv5tsNGQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505222118.Hv5tsNGQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/qmi_encdec.c:359:50: sparse: sparse: cast to restricted __le16
>> drivers/soc/qcom/qmi_encdec.c:676:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] val32 @@     got restricted __le32 [usertype] @@
   drivers/soc/qcom/qmi_encdec.c:676:31: sparse:     expected unsigned int [usertype] val32
   drivers/soc/qcom/qmi_encdec.c:676:31: sparse:     got restricted __le32 [usertype]

vim +359 drivers/soc/qcom/qmi_encdec.c

   279	
   280	/**
   281	 * qmi_encode() - Core Encode Function
   282	 * @ei_array: Struct info array describing the structure to be encoded.
   283	 * @out_buf: Buffer to hold the encoded QMI message.
   284	 * @in_c_struct: Pointer to the C structure to be encoded.
   285	 * @out_buf_len: Available space in the encode buffer.
   286	 * @enc_level: Encode level to indicate the depth of the nested structure,
   287	 *             within the main structure, being encoded.
   288	 *
   289	 * Return: The number of bytes of encoded information on success or negative
   290	 * errno on error.
   291	 */
   292	static int qmi_encode(const struct qmi_elem_info *ei_array, void *out_buf,
   293			      const void *in_c_struct, u32 out_buf_len,
   294			      int enc_level)
   295	{
   296		const struct qmi_elem_info *temp_ei = ei_array;
   297		u8 opt_flag_value = 0;
   298		u32 data_len_value = 0, data_len_sz;
   299		u8 *buf_dst = (u8 *)out_buf;
   300		u8 *tlv_pointer;
   301		u32 tlv_len;
   302		u8 tlv_type;
   303		u32 encoded_bytes = 0;
   304		const void *buf_src;
   305		int encode_tlv = 0;
   306		int rc;
   307		u8 val8;
   308		u16 val16;
   309	
   310		if (!ei_array)
   311			return 0;
   312	
   313		tlv_pointer = buf_dst;
   314		tlv_len = 0;
   315		if (enc_level == 1)
   316			buf_dst = buf_dst + (TLV_LEN_SIZE + TLV_TYPE_SIZE);
   317	
   318		while (temp_ei->data_type != QMI_EOTI) {
   319			buf_src = in_c_struct + temp_ei->offset;
   320			tlv_type = temp_ei->tlv_type;
   321	
   322			if (temp_ei->array_type == NO_ARRAY) {
   323				data_len_value = 1;
   324			} else if (temp_ei->array_type == STATIC_ARRAY) {
   325				data_len_value = temp_ei->elem_len;
   326			} else if (data_len_value <= 0 ||
   327				    temp_ei->elem_len < data_len_value) {
   328				pr_err("%s: Invalid data length\n", __func__);
   329				return -EINVAL;
   330			}
   331	
   332			switch (temp_ei->data_type) {
   333			case QMI_OPT_FLAG:
   334				rc = qmi_encode_basic_elem(&opt_flag_value, buf_src,
   335							   1, sizeof(u8));
   336				if (opt_flag_value)
   337					temp_ei = temp_ei + 1;
   338				else
   339					temp_ei = skip_to_next_elem(temp_ei, enc_level);
   340				break;
   341	
   342			case QMI_DATA_LEN:
   343				data_len_sz = temp_ei->elem_size == sizeof(u8) ?
   344						sizeof(u8) : sizeof(u16);
   345				/* Check to avoid out of range buffer access */
   346				if ((data_len_sz + encoded_bytes + TLV_LEN_SIZE +
   347				    TLV_TYPE_SIZE) > out_buf_len) {
   348					pr_err("%s: Too Small Buffer @DATA_LEN\n",
   349					       __func__);
   350					return -ETOOSMALL;
   351				}
   352				if (data_len_sz == sizeof(u8)) {
   353					val8 = *(u8 *)buf_src;
   354					data_len_value = val8;
   355					rc = qmi_encode_basic_elem(buf_dst, &val8,
   356								   1, data_len_sz);
   357				} else {
   358					val16 = *(u16 *)buf_src;
 > 359					data_len_value = le16_to_cpu(val16);
   360					rc = qmi_encode_basic_elem(buf_dst, &val16,
   361								   1, data_len_sz);
   362				}
   363				UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
   364							encoded_bytes, tlv_len,
   365							encode_tlv, rc);
   366				if (!data_len_value)
   367					temp_ei = skip_to_next_elem(temp_ei, enc_level);
   368				else
   369					encode_tlv = 0;
   370				break;
   371	
   372			case QMI_UNSIGNED_1_BYTE:
   373			case QMI_UNSIGNED_2_BYTE:
   374			case QMI_UNSIGNED_4_BYTE:
   375			case QMI_UNSIGNED_8_BYTE:
   376			case QMI_SIGNED_2_BYTE_ENUM:
   377			case QMI_SIGNED_4_BYTE_ENUM:
   378				/* Check to avoid out of range buffer access */
   379				if (((data_len_value * temp_ei->elem_size) +
   380				    encoded_bytes + TLV_LEN_SIZE + TLV_TYPE_SIZE) >
   381				    out_buf_len) {
   382					pr_err("%s: Too Small Buffer @data_type:%d\n",
   383					       __func__, temp_ei->data_type);
   384					return -ETOOSMALL;
   385				}
   386				rc = qmi_encode_basic_elem(buf_dst, buf_src,
   387							   data_len_value,
   388							   temp_ei->elem_size);
   389				UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
   390							encoded_bytes, tlv_len,
   391							encode_tlv, rc);
   392				break;
   393	
   394			case QMI_STRUCT:
   395				rc = qmi_encode_struct_elem(temp_ei, buf_dst, buf_src,
   396							    data_len_value,
   397							    out_buf_len - encoded_bytes,
   398							    enc_level + 1);
   399				if (rc < 0)
   400					return rc;
   401				UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
   402							encoded_bytes, tlv_len,
   403							encode_tlv, rc);
   404				break;
   405	
   406			case QMI_STRING:
   407				rc = qmi_encode_string_elem(temp_ei, buf_dst, buf_src,
   408							    out_buf_len - encoded_bytes,
   409							    enc_level);
   410				if (rc < 0)
   411					return rc;
   412				UPDATE_ENCODE_VARIABLES(temp_ei, buf_dst,
   413							encoded_bytes, tlv_len,
   414							encode_tlv, rc);
   415				break;
   416			default:
   417				pr_err("%s: Unrecognized data type\n", __func__);
   418				return -EINVAL;
   419			}
   420	
   421			if (encode_tlv && enc_level == 1) {
   422				QMI_ENCDEC_ENCODE_TLV(tlv_type, tlv_len, tlv_pointer);
   423				encoded_bytes += (TLV_TYPE_SIZE + TLV_LEN_SIZE);
   424				tlv_pointer = buf_dst;
   425				tlv_len = 0;
   426				buf_dst = buf_dst + TLV_LEN_SIZE + TLV_TYPE_SIZE;
   427				encode_tlv = 0;
   428			}
   429		}
   430	
   431		return encoded_bytes;
   432	}
   433	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

